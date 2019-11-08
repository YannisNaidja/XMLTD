#!/bin/bash

mongoimport --db DRINKY --collection products --file products.json --jsonArray --drop
mongoimport --db DRINKY --collection members --file members.json --jsonArray --drop
mongoimport --db DRINKY --collection basket --file basket.json --jsonArray --drop