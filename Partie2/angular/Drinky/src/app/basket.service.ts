import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Subject, BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BasketService {
  private dbUrl = 'http://localhost:8888/';
  private basket = new BehaviorSubject<any>(undefined);

  constructor(private http : HttpClient) { }

  updateBasket(user_mail : string) {
    this.findById(user_mail).subscribe(res => {
      this.basket.next(res);
    });
  }

  getBasket() {
    return this.basket;
  }
  
  findById(userid : string) : Observable<any>{
    return this.http.get(this.dbUrl + 'basket/' + userid);
  }
  
  insert(user_mail : string, id_product : string, name : string, quantity : number) : Observable<any> {
    return this.http.post(this.dbUrl + 'basket/' + user_mail + "/" + id_product + "/quantity", {
      "quantity" : quantity
    }); 
  }
  
  update(user_mail : string, id_product : string, quantity : number) : Observable<any>{
    return this.http.post(this.dbUrl + 'basket/' + user_mail + "/" + id_product + "/quantity", {
      "quantity" : quantity
    }); 
  }
  
  emptyBasket(user_mail : string) : Observable<any>{
    return this.http.post(this.dbUrl + 'emptyBasket', {
      "user_mail" : user_mail
    });
  }
  
  delete(user_mail : string, id_product : string): Observable <any>{
    return this.http.post(this.dbUrl + 'removeProduct',{
      "user_mail" : user_mail,
      "product_code" : id_product
    });
  }
}
