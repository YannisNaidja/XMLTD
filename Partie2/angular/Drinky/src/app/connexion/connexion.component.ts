import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../authentication.service';

@Component({
  selector: 'app-connexion',
  templateUrl: './connexion.component.html',
  styleUrls: ['./connexion.component.css']
})
export class ConnexionComponent implements OnInit {

  private password : string ="";
  private email : string ="";
  constructor(authentif : AuthenticationService) { }

  ngOnInit() {
  }

  onSubmit(){
    console.log(this.email);
    console.log(this.password);
  }
}
