import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../authentication.service';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-authentication',
  templateUrl: './authentication.component.html',
  styleUrls: ['./authentication.component.css']
})
export class AuthenticationComponent implements OnInit {
  private password : string ="";
  private email : string ="";
  private wrongid : boolean = false;
  private connected : boolean = false;
  private member : Observable<any>;
  
  constructor(private authenticationService : AuthenticationService,
              private router: Router) {
    this.member = this.authenticationService.getMember();
  }

  ngOnInit() {
    
  }

  onSubmit(){
    this.authenticationService.checkExists(this.email, this.password).subscribe(member => {
      if (Object.keys(member).length > 0) {
        this.wrongid = false;
        this.authenticationService.logIn(member);
        this.connected = true;
        this.router.navigate(['/products']);
      }
      else{
        this.wrongid = true;           
      } 
    });
  }
  getEmail(){
    if(this.email !== ""){
      console.log("renvoi");
      return this.email;
    }
  }
}
