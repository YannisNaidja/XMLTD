import { Component, OnInit } from '@angular/core';
import { RegistrationService } from '../registration.service';
import { Router } from '@angular/router';

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
  private wrongInput : boolean = false;
  
  constructor(private registrationService : RegistrationService,
              private router : Router) { }

  ngOnInit() {
  }
  checkinput(){
    console.log("mail entre :" +this.mailAddress + "password entre: "+ this.password );
    if(this.mailAddress !== "" && this.password !== ""){
      this.wrongInput = false;
    }
    else{
      this.wrongInput = true;
    }
    console.log("le wronginput vaut "+ this.wrongInput);
  }

  onSubmit() {
    this.checkinput();
    if(!this.wrongInput){
    this.registrationService.createMember(this.firstName, this.name, this.mailAddress, this.password).subscribe(p => {
      console.log(p);
      this.router.navigate(['/products']);
      });
    }
  }
}
