import { Component } from '@angular/core';
import { AuthenticationService } from './authentication.service';
import { Observable } from 'rxjs' ;

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  private member : Observable<any>;
  private currentUrl : string;
  
  constructor(private authenticationService : AuthenticationService) {
    this.member = this.authenticationService.getMember();
  }

  title = 'Drinky';

  
}
