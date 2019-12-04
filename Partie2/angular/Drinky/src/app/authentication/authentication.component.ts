import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../authentication.service';

@Component({
  selector: 'app-authentication',
  templateUrl: './authentication.component.html',
  styleUrls: ['./authentication.component.css']
})
export class AuthenticationComponent implements OnInit {

  constructor(private authenticationService : AuthenticationService) {}

    ngOnInit() {
	this.authenticationService.checkExists('jean.pierre@mail.com', 'jp0102').subscribe(member => {
	    if (Object.keys(member).length > 0) {
		this.authenticationService.logIn(member);
	    }

	    console.log(this.authenticationService.isLogged());
	});
  }

}
