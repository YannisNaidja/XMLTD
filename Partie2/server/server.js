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
	     	    products.push(doc.content);
	     	}
		console.log(products);
		res.end(JSON.stringify(products));		
	     });
	} catch(e) {
	    console.log("Error on /products : " + e);
	    res.end(JSON.stringify([]));
	}
    });
});

app.listen(8888);
