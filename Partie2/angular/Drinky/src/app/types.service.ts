import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TypesService {
  private dbUrl = 'http://localhost:8888/';
  
  constructor(private http : HttpClient) {
    // Does nothing on construction
  }

  getTypes(): Observable<any> {
    return this.http.get(this.dbUrl + 'types');
  }
}
