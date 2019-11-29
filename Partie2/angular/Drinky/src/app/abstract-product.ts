import { Product } from './product';

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
}
