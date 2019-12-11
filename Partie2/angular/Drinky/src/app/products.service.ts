import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Subject, BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductsService {
  private dbUrl = 'http://localhost:8888/';
  private categoryChecker = new BehaviorSubject(undefined);
  private currentCategory = this.categoryChecker.asObservable();
  
  constructor(private http : HttpClient) {
    // Does nothing on construction
  }

  getProducts(): Observable<any> {
    return this.http.get(this.dbUrl + 'products');
  }

  findByCode(code : string): Observable<any> {
    return this.http.get(this.dbUrl + "products/" + code);
  }

  changecategory(category: any) {
    this.categoryChecker.next(category);
  }

  searchProducts(category : string,
		 productname : string,
		 prixmin : string, 
		 prixmax : string,
		 brand : string,
		 type : string) : Observable<any> {
    return this.http.get(this.dbUrl + 'products/' + 'search/'
			 + category + '/' + productname + '/' + prixmin + '/' + prixmax
			 +'/'+ brand + '/' + type);
  }

  getCurrentCategory() : Observable<any> {
    return this.currentCategory;
  }

  getProductNames() : Observable<any> {
    return this.http.get(this.dbUrl + 'product/names');
  }
}
