import { Component, OnInit } from '@angular/core';
import { RegistrationService } from '../registration.service';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {
  private firstName : string = "";
  private name : string = "";
  private mailAddress : string = "";
  private password : string = "";
  
  constructor(private registrationService : RegistrationService) { }

  ngOnInit() {
  }

  onSubmit() {
    this.registrationService.createMember(this.firstName, this.name, this.mailAddress, this.password).subscribe(p => {
      console.log(p);
    });
  }
}
