import { Product } from './product';
import { AlcoholicBeverage } from './alcoholic-beverage';

export class AbstractProduct implements Product {
    code: string;
    name: string;
    price: number;
    brand: string;
    productType: string;
    extras: any;

    constructor (dbObject : any) {
	this.code = dbObject.code;
	this.name = dbObject.name;
	this.price = dbObject.price;
	this.brand = dbObject.brand;
	this.productType = dbObject.type;
	this.extras = dbObject.extras;
    }

    getExtras() {
	return [];
    }

    static createProduct(dbObject: any) {
	switch(dbObject.category_code) {
	case 'ALC':
	    return new AlcoholicBeverage(dbObject);
	    break;
	default:
	    return new AbstractProduct(dbObject);
	}
    }
}
