import { AlcoholicBeverage } from './alcoholic-beverage';
import { AbstractProduct } from './abstract-product';

export class ProductFactory {
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
