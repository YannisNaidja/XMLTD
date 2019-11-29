import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductsService {
  private dbUrl = 'http://localhost:8888/';
  
  constructor(private http : HttpClient) { }

    getProducts(): Observable<any> {
	return this.http.get(this.dbUrl + 'products');
    }
}
