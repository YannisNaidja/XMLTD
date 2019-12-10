import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BrandsServiceService {
  private dbUrl = 'http://localhost:8888/';
  
  constructor(private http : HttpClient) {
    // Does nothing on construction
  }

  getBrands(): Observable<any> {
    return this.http.get(this.dbUrl + 'brands');
  }
}
