const express = require('express');
const app = express();

app.use(express.json());
app.use(express.urlencoded({extended : true}));
app.use(function(req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', '*');
    next();
});

const MongoClient = require('mongodb').MongoClient;
const ObjectID = require('mongodb').ObjectId;
const url = "mongodb://localhost:27017";

function findProducts(categories, extras_wordings, product_id, brands_list, types_list) {
    let products = [];
    
    for (let category of categories) {
	for (let product of category.content) {
	    if (typeof product_id === 'undefined' || product.code === product_id) {
		product['category_code'] = category.category_code;
		product['category_name'] = category.category_name;
		product['category_img'] = category.category_img;

		var extra_property = [], brand_property = [];

	
		for (let key in product.extra) {
		    for (let extra_wording of extras_wordings) {
			if (extra_wording.extra_key === key) {
			    extra_property.push({
				'key' : extra.wording,
				'value' : product.extra[key]
			    });
			}
		    }
		}

		for (let brand of brands_list) {
		    if (brand.brand_key === product.brand) {
			product.brand = brand.wording;
		    }
		}

		for (let type of types_list) {
		    if (type.type_key === product.type) {
			product.type = type.wording;
		    }
		}
		    
		product['extra'] = extra_property;
		products.push(product);
	    }
	}
    }
    
    return products;
}

MongoClient.connect(url, {useNewUrlParser: true , useUnifiedTopology: true }, (err, client) => {
    let db = client.db("DRINKY");

    app.get("/products", (req,res) => {
	console.log("/products");

	try {
	    let types_list = [];

	    db.collection("types").find().toArray((err, types) => {
		for (type of types) {
		    types_list.push(type);

		    if (types_list.length === types.length) {
			let brands_list = [];

			db.collection("brands").find().toArray((err, brands) => {
			    for (brand of brands) {
				brands_list.push(brand);

				if (brands_list.length === brands.length) {
				    let extras_wordings = [];
				    
				    db.collection("extras").find().toArray((err, extras) => {
					for (extra of extras) {
					    extras_wordings.push(extra);

					    if (extras_wordings.length === extras.length) {
						db.collection("products").find().toArray((err, categories) => {
						    let products = findProducts(categories, extras_wordings, undefined, brands_list, types_list);
						    
						    res.end(JSON.stringify(products));
						});

					    }
					}
				    });
				}
			    }
			});
		    }
		}
	    });
			
	} catch(e) {
	    console.log("Error on /products : " + e);
	    res.end(JSON.stringify([]));
	}
    });

    app.get("/products/:product_id", (req, res) => {
	console.log("/products/" + req.params.product_id);

	try {
	    let types_list = [];
	    
	    db.collection("types").find().toArray((err, types) => {
		for (type of types) {
		    types_list.push(type);

		    if (types_list.length === types.length) {
			let brands_list = [];

			db.collection("brands").find().toArray((err, brands) => {
			    for (brand of brands) {
				brands_list.push(brand);

				if (brands_list.length === brands.length) {

				    let extras_wordings = [];
				    let found = false;

				    db.collection("extras").find().toArray((err, extras) => {
					for (extra of extras) {
					    extras_wordings.push(extra);
					    if (extras_wordings.length === extras.length) {
						db.collection("products").find().toArray((err, categories) => {
						    let products = findProducts(categories, extras_wordings, req.params.product_id, brands_list, types_list);
						    
						    if (products.length > 0) {
							res.end(JSON.stringify(products[0]));
						    } else {
							res.end(JSON.stringify([]));
						    }
						});
					    }
					}
				    });
				}
			    }
			});
		    }
		}
	    });
	} catch(e) {
	    console.log("Error on /products : " + e);
	    res.end(JSON.stringify([]));
	}
    });

    app.get("/product/names", (req, res) => {
	console.log('/products/name/');

	try {
	    let products = [];
	    
	    db.collection("products").find().toArray((err, categories) => {
		let result = [];
		
		for (let category of categories) {
		    for (let product of category.content) {
			result.push({
			    "code" : product.code,
			    "name" : product.product_name
			});
		    }
		}

		res.end(JSON.stringify(result));
	    }); 
	} catch(e) {
	    console.log("Error on /products/name/" + req.params.code + " : " + e);
	    res.end(JSON.stringify([]));
	}
    });

   
    app.get("/products/search/:category_code/:product_name/:pricemin/:pricemax/:brand/:type", (req, res) => {
	let results = [];
	var PrixMinMaxPresent = false;
	
	try {
	    db.collection("products").find().toArray((err, documents) => {
		for (let category of documents) {
		    if (req.params.category_code === '*' || category.category_code === req.params.category_code) {
			for (let product of category.content) {
			    let add = true;
			    
			    if (req.params.product_name !== '*') {
				if (product.product_name.indexOf(req.params.product_name) === -1) {
				    add = false;
				}
			    }

			    if (product.price < req.params.pricemin) {
				add=false;
			    }
			    
			    if(req.params.pricemax !== '*'){ 
				if (product.price > req.params.pricemax) {
				    add = false;
				}
			    }

			    if (req.params.brand !== '*') {
				if (req.params.brand !== product.brand) {
				    add = false;
				}
			    }

			    if (req.params.type !== '*') {
				if (req.params.type !== product.type) {
				    add = false;
				}
			    }
			    
			    if (add) {
				product.category_code = category.category_code;
				product.category_name = category.category_name;
				product.category_img = category.category_img;
				
				results.push(product);
			    }
			}
		    }
		}

		res.end(JSON.stringify(results));
	    });
	} catch(e) {
	    console.log("Error on /products/search");
	}
    });

    app.get("/members", (req, res) => {
	console.log("/members");

	try {
	    let products = [];
	    db.collection("members").find().toArray((err, documents) => {
		res.end(JSON.stringify(documents));
	    });
	} catch(e) {
	    console.log("Error on /members : " + e);
	    res.end(JSON.stringify([]));
	}
    });

    app.get("/members/:mail/:password", (req, res) => {
	console.log("/members/" + req.params.mail + "/" + req.params.password);

	try {
	    let products = [];
	    db.collection("members").find().toArray((err, documents) => {
		for (let document of documents) {
		    if (document.mail === req.params.mail && document.password === req.params.password) {
			res.end(JSON.stringify(document));
		    }
		}

		res.end(JSON.stringify({}));
	    });
	} catch(e) {
	    console.log("Error on /members/:mail/:password : " + e);
	    res.end(JSON.stringify([]));
	}
    });

    app.get("/basket", (req, res) => {
	console.log("/basket");

	try {
	    let products = [];
	    db.collection("basket").find().toArray((err, documents) => {
		res.end(JSON.stringify(documents));
	    });
	} catch(e) {
	    console.log("Error on /documents : " + e);
	    res.end(JSON.stringify([]));
	}
    });

    app.post("/basket/:mail/:product/quantity", (req, res) => {
    	console.log('/basket/' + req.params.mail + "/" + req.params.product + "/quantity");
	console.log(req.params.mail);
	try {
	    let found = false;
    	    db.collection("basket").find()
    		.toArray((err, users) => {
		    let userFound = false;
    		    let result = [];

		    for (let user of users) {
			if (user.user_mail === req.params.mail) {
			    userFound = true;

			    let productFound = false;
    			    for (let product of user.basket) {
    				if (product.product_code === req.params.product) {
				    productFound = true;
    				    product.quantity += req.body.quantity;
    				}
				
    				result.push(product);
    			    }

			    if (! productFound) {
				result.push({
    				    'product_code' : req.params.product,
				    'quantity' : req.body.quantity
    				});
			    }
			}
		    }

		    console.log(userFound);
		    if (userFound) {
			db.collection("basket").updateOne({'user_mail' : req.params.mail}, { $set : {'basket' : result }});
		    } else {
			result.push({
    			    'product_code' : req.params.product,
			    'quantity' : req.body.quantity
    			});

			db.collection("basket").insert({
			    'user_mail' : req.params.mail,
			    'basket' : result
			});
		    }
		    
		    res.end(JSON.stringify(result));
		});
	} catch (error) {
	    console.log('Error on GET /basket/:mail/:product/quantity');
	    res.status(400);
	    res.end(JSON.stringify([]));
	}
    });
    
    app.get("/basket/:mail", (req, res) => {
	console.log("/basket/" + req.params.mail);

	try {
	    let products = [];
	    db.collection("basket").find().toArray((err, documents) => {
		for (let document of documents) {
		    if (document.user_mail === req.params.mail) {
			console.log("le serveur envoi" + document.basket);
			res.end(JSON.stringify(document.basket));
		    }
		}
	    });
	} catch(e) {
	    console.log("Error on /basket/:mail : " + e);
	    res.end(JSON.stringify([]));
	}
    });
	
    app.post("/members" , (req, res) => { //check si pas deja inscrit
	db.collection("members").find({mail : req.body.mail})
	    .count()
	    .then(function(items) {
		if (items === 0) {
		    console.log("client existe pas on l'ajoute");	
			db.collection("members").insertOne(req.body);
			db.collection("basket").insertOne({ 'user_mail' : req.body.mail ,'basket' :  [] });
		    res.end(JSON.stringify(req.body));
		} else {
		    console.log("client existe deja");
		    res.status(400);
		    res.end(JSON.stringify({}));
		}
	    });
	});

    app.post("/removeProduct" , (req, res) => {
	db.collection("basket").find({'user_mail' : req.body.user_mail})
	    .toArray((err, documents) => {
		let newbasket = [];
		let basket = documents[0].basket;
		console.log("basket vaut" +JSON.stringify(basket));
		for(let items of basket){
		    if(req.body.product_code !== items.product_code){
			newbasket.push(items);
		    }
		}
		console.log(JSON.stringify(newbasket));
		try {
		    db.collection("basket").updateOne(
			{'user_mail' : req.body.user_mail},
			{ $set : {'basket' : newbasket }});
			res.end(JSON.stringify(newbasket));
		} catch (error) {
		    console.log('Error on POST /basket');
		    res.status(400);
		    res.end(JSON.stringify([]));
		}
	    });	
    });	

   
    app.post("/emptyBasket" , (req, res) => {

	db.collection("basket").find({'user_mail' : req.body.user_mail})
	    .toArray((err, documents) => {
		var basket = new Array(); 	
		try {
		    db.collection("basket").updateOne(
			{'user_mail' : req.body.user_mail},
			{ $set : {'basket' : basket }});
			res.end(JSON.stringify(basket));
		} catch (error) {
		    print(error);
		}
	    });	
    });	

    // TODO: Add try/catch
    app.post("/modifBasket" , (req, res) => {
	//marche
	db.collection("basket").find({'user_mail' : req.body.user_mail})
	    .toArray((err, documents) => {
		let basket = documents[0].basket;
		for(let items of basket){
		    if (req.body.product_code === items.product_code )	{						
			items.quantity = req.body.quantity;
			console.log("la quantity vaut"+JSON.stringify(items.quantity));
			console.log("le basket vaut" +JSON.stringify(basket));
			try {
			    db.collection("basket").updateOne(
				{'user_mail' : req.body.user_mail },
				{ $set : {'basket' : basket }});
				res.end(JSON.stringify(basket));
			} catch (error) {
				console.log('Error on POST /modifBasket');
				res.status(400);
				res.end(JSON.stringify([]));
					}
		    }	
		}
	    });
    });

    // TODO: Remove db id in /brands and types
    app.get('/brands', (req, res) => {
	console.log('/brands');
	
	try {
	    db.collection("brands").find().toArray((err, documents) => {
		console.log(documents);
		res.end(JSON.stringify(documents));
	    });
	} catch (error) {
	    console.log("Error on /brands : " + error);
	    res.end(JSON.stringify([]));
	}
    });

    app.get('/types', (req, res) => {
	console.log('/types');
	
	try {
	    db.collection("types").find().toArray((err, documents) => {
		console.log(documents);
		res.end(JSON.stringify(documents));
	    });
	} catch (error) {
	    console.log("Error on /types : " + error);
	    res.end(JSON.stringify([]));
	}
    });
});// fin classe 

app.listen(8888);



