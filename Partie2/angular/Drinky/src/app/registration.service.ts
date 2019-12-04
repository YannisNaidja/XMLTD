import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RegistrationService {
  private dbUrl = 'http://localhost:8888/';
  
  constructor(private http : HttpClient) { }

  createMember(firstName : string,
	       name : string,
	       mailAddress : string,
	       password : string): Observable<any> {
    return this.http.post(this.dbUrl + 'members', {
      name : name,
      first_name : firstName,
      mail : mailAddress,
      password : password
    });
  }
}
