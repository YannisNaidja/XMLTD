import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class BasketService {
    private dbUrl = 'http://localhost:8888/';

    constructor(private http : HttpClient) { }

    
  getBasket(userid) : Observable<any>{
    console.log("lid vaut "+ "basket/"+userid);
    return this.http.get(this.dbUrl+'basket/'+userid);
  }
  AddBasket(user_mail,id_product,quantity) : Observable<any> {
    return this.http.post(this.dbUrl + 'basket', {
      "user_mail" : user_mail,
      "product_code" : id_product,
      "quantity" : quantity
    }); 
  }
  ModifiyBasket(user_mail,quantity) : Observable<any>{
    return this.http.post(this.dbUrl + 'modifBasket', {
      "user_mail" : user_mail,
      "quantity" : quantity
    });
  }
  emptyBasket(user_mail) : Observable<any>{
    return this.http.post(this.dbUrl + 'emptyBasket', {
      "user_mail" : user_mail
    });
  }
  removeItem(user_mail,id_product): Observable <any>{
    return this.http.post(this.dbUrl+ 'removeProduct',{
      "user_mail" : user_mail,
      "product_code" : id_product
    });
  }

}
