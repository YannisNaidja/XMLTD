import { Component } from '@angular/core';
import { AuthenticationService } from './authentication.service';
import { Observable } from 'rxjs' ;
import { Router } from '@angular/router';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  private member : Observable<any>;
  
  constructor(private authenticationService : AuthenticationService,
    private router : Router) {
    this.member = this.authenticationService.getMember();
    this.router.navigate(['/products']);
  }

  title = 'Drinky';

  
}
