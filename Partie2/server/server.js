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

function findProducts(categories, extras_wording, category) {
    let products = [];
    
    for (let category of categories) {
	for (let product of category.content) {
	    product['category_code'] = category.category_code;
	    product['category_name'] = category.category_name;
	    product['extra'] = [];
	    
	    var extra_property = [];

	    for (let key in product.extra) {
		for (let extra_wording of extras_wordings) {
		    if (extra_wording.extra_key === key) {
			extra_property.push({
			    'key' : extra.wording,
			    'value' : product.extra[key]
			});
		    }
		}

		product['extra'] = extra_property;
	    }
	    
	    products.push(product);
	}
    }

    return products;
}

MongoClient.connect(url, {useNewUrlParser: true}, (err, client) => {
    let db = client.db("DRINKY");

    app.get("/products", (req,res) => {
	console.log("/products");

	try {
	    let extras_wordings = [];

	    db.collection("extras").find().toArray((err, extras) => {
		for (extra of extras) {
		    extras_wordings.push(extra);

		    if (extras_wordings.length === extras.length) {
			db.collection("products").find().toArray((err, categories) => {
			    let products = findProducts(categories, extras_wordings, undefined);
			    
			    res.end(JSON.stringify(products));
			});

		    }
		}


	    });
	    
	} catch(e) {
	    console.log("Error on /products : " + e);
	    res.end(JSON.stringify([]));
	}
    });

    app.get("/products/:category", (req,res) => {
	console.log("/products/" + req.params.category);

	try {
	    let products = [];
	    db.collection("products").find().toArray((err, documents) => {
		for (let doc of documents) {
		    if (doc.category_code === req.params.category) {
			for (let content of doc.content) {
			    content['category_code'] = doc.category_code;
	     		    products.push(content);
			}
		    }
	     	}
		console.log(products);
		res.end(JSON.stringify(products));		
	    });
	} catch(e) {
	    console.log("Error on /products/:category : " + e);
	    res.end(JSON.stringify([]));
	}
    });

    
    app.get("/members", (req,res) => {
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

    app.get("/members/:mail/:password", (req,res) => {
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

    app.get("/basket", (req,res) => {
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

    app.get("/basket/:mail", (req,res) => {
	console.log("/basket/" + req.params.mail);

	try {
	    let products = [];
	    db.collection("basket").find().toArray((err, documents) => {
		for (let document of documents) {
		    if (document.user_mail === req.params.mail) {
			res.end(JSON.stringify(document.basket));
		    }
		}
	    });
	} catch(e) {
	    console.log("Error on /basket/:mail : " + e);
	    res.end(JSON.stringify([]));
	}
    });
	
    app.post("/members" , (req,res) => { //check si pas deja inscrit
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

	app.post("/basket" , (req,res) => {

		db.collection("basket").find({'user_mail' : req.body.user_mail})
			.toArray((err, documents) => {
		
				let basket = documents[0].basket;
				console.log(basket);
				basket.push(req.body.product);
				try {
					db.collection("basket").updateOne(
						{'user_mail' : req.body.user_mail},
						{ $set : {'basket' : basket }});
				} catch (error) {
					print(error);
				}
			});	
	});	


	app.post("/supprProduct" , (req,res) => {

		db.collection("basket").find({'user_mail' : req.body.user_mail})
			.toArray((err, documents) => {
				let newbasket = { "user_mail" : req.body.user_mail , basket :[]  }
				let basket = documents[0].basket;
				for(let items of basket){
					if(req.body.product_code !== items.product_code){
						newbasket.basket.push(items);
					}
				}
				console.log(JSON.stringify(newbasket));
				try {
					db.collection("basket").updateOne(
						{'user_mail' : req.body.user_mail},
						{ $set : {'basket' : newbasket }});
				} catch (error) {
					print(error);
				}
			});	
	});	

	app.post("/emptyBasket" , (req,res) => {

		db.collection("basket").find({'user_mail' : req.body.user_mail})
			.toArray((err, documents) => {
				let newbasket = { "user_mail" : req.body.user_mail , basket :[]  }
				try {
					db.collection("basket").updateOne(
						{'user_mail' : req.body.user_mail},
						{ $set : {'basket' : newbasket }});
				} catch (error) {
					print(error);
				}
			});	
	});	

		app.post("/modifBasket" , (req,res) => {
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
						} catch (error) {
							print(error);
							
						}
					}	
				}
					
			});
	});

    app.get("/products/search/:category_code/:product_name/:pricemin/:pricemax/:brand/:type/:extra", (req, res) => {
	let results = [];

	try {
	    db.collection("products").find({ "category_code" : req.params.category_code }).toArray((err, documents) => {
		for (let category of documents) {
		    if (category.category_code === req.params.category_code) {
			for (let product of category.content) {
			    let add = true;
			    
			    if (req.params.product_name !== '*') {
				if (product.product_name.indexOf(req.params.product_name) === -1) {
				    add = false;
				}
			    }

			    if (req.params.pricemin !== '*' && req.params.pricemax !== '*') {
				if (product.price < req.params.pricemin || product.price > req.params.pricemax) {
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
				results.push(product);
			    }
			}
		    }
		}

		res.end(JSON.stringify(results));
	    });
	} catch(e) {
	    console.log("Error on ");
	}
    });
    
});

app.listen(8888);


