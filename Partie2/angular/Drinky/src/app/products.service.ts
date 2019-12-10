import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Subject, BehaviorSubject } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class ProductsService {
    private dbUrl = 'http://localhost:8888/';
    private categorychecker = new BehaviorSubject(undefined);
    currentcategory = this.categorychecker.asObservable();
    
    constructor(private http : HttpClient) { }

    getProducts(): Observable<any> {
	return this.http.get(this.dbUrl + 'products');
    }

    findByCode(code : string): Observable<any> {
	return this.http.get(this.dbUrl + "products/" + code);
    }

    changecategory(category: any) {
        this.categorychecker.next(category);
      }

    Research(category : string , productname : string , prixmin : string , 
            prixmax : string, brand : string
            , type : string, extra : string ){

        return this.http.get(this.dbUrl + 'products/'+'search/'
            +category+'/'+productname+'/'+prixmin+'/'+prixmax
            +'/'+brand+'/'+type+'/'+extra);
    }
}
