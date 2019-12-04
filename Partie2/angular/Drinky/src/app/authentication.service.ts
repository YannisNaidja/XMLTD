import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Subject, BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
    private dbUrl = 'http://localhost:8888/';
    private member : any = undefined;
    private member : Subject<any> = new BehaviorSubject<any>(undefined);
    
    constructor(private http : HttpClient) { }

    checkExists(mail, password) : Observable<any> {
	return this.http.get(this.dbUrl + 'members/' + mail + '/' + password);
    }

    getMember() {
	return this.member !== undefined;
    }

    logIn(member) {
	this.member.next(member);
    }

    isLogged() : boolean {
	return typeof this.member.value !== 'undefined';
    }
}
