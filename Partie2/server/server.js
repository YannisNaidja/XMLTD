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


MongoClient.connect(url, {useNewUrlParser: true}, (err, client) => {
    let db = client.db("DRINKY");

    app.get("/products", (req,res) => {
	console.log("/products");

	try {
	    let products = [];
	    db.collection("products").find().toArray((err, documents) => {
		for (let doc of documents) {
		    for (let content of doc.content) {
	     		products.push(content);
		    }
	     	}

		res.end(JSON.stringify(products));		
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
	     		    products.push(content);
			}
		    }
	     	}
		console.log(products);
		res.end(JSON.stringify(products));		
	    });
	} catch(e) {
	    console.log("Error on /products : " + e);
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
	    console.log("Error on /documents : " + e);
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
	    });
	} catch(e) {
	    console.log("Error on /documents : " + e);
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
	    console.log("Error on /documents : " + e);
	    res.end(JSON.stringify([]));
	}
    });
	
    app.post("/members" , (req,res) => { //check si pas deja inscrit
	console.log();
	db.collection("members").find({mail : req.body.mail})
	    .count()
	    .then(function(items) {
		if (items === 0) {
		    console.log("client existe pas on lajoute");	
		    db.collection("members").insertOne(req.body);
		    res.end(JSON.stringify(req.body));
		} else {
		    console.log("client existe deja");
		    res.status(400);
		    res.end(JSON.stringify({}));
		}
	    });
    });
    
});

app.listen(8888);
