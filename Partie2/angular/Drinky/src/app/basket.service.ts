import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class BasketService {
    private dbUrl = 'http://localhost:8888/';

    constructor(private http : HttpClient) { }

    getBasket(mail){
	return this.http.get(this.dbUrl+ 'basket/'+ mail);
    }

    addBasket(user_mail,id_product,quantity) : Observable<any> {
	return this.http.post(this.dbUrl + 'basket', {
	    "user_mail" : user_mail,
	    "product_code" : id_product,
	    "quantity" : quantity
	}); // le suscribe doit etre dans le composant
    }

    modifiyBasket(quantity) : Observable<any>{
	return this.http.post(this.dbUrl + 'modifBasket', {
	    "user_mail" : user_mail,
	    "product " : id_product,
	    "quantity" : quantity
	});
    }
}
