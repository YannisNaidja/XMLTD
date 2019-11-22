import { AbstractProduct } from './abstract-product';

export class AlcoholicBeverage extends AbstractProduct {
    constructor (dbObject : any) {
	super(dbObject);
    }
    
    getExtras() {
	return [
	     'Degré d\'alcool : ' + this.extras['alcohol_volume'] + '°'
	]
    }
}
