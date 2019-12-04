import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
    private dbUrl = 'http://localhost:8888/';
    
    constructor(private http : HttpClient) { }

    logIn(mail, password) : boolean {
	this.http.get(this.dbUrl + "members/" + mail + "/" + password).subscribe();
    }
}
