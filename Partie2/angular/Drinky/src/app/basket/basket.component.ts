import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { BasketService } from '../basket.service';
import { AuthenticationService } from '../authentication.service';
import { Router } from '@angular/router';


@Component({
  selector: 'basket',
  templateUrl: './basket.component.html',
  styleUrls: ['./basket.component.css']
})
export class BasketComponent implements OnInit {

  private basket : any[] = new Array();
  private member : any;
  private empty : boolean;
  private trigger : boolean;
  private mail : any;
  
  

  constructor(private  basketservice : BasketService, 
              authentication : AuthenticationService,
              private router : Router) { 
   this.member = authentication.getMember();
   this.mail = this.member.value.mail;
   console.log(this.member);
  }

  ngOnInit() {
   
  }
loadBasket(){
  
  this.basketservice.getBasket(this.member.value.mail).subscribe(b => {
    console.log("le serveur envoi : "+b);
    this.basket = b;

    console.log("le mail vaut"+this.mail);
    console.log("le basket vaut"+this.basket);
    if(this.basket.length === 0 ){
      console.log("panier vide");
      this.empty = true;
    }
    else{
      this.empty= false;
    } 
    
    });
  }
  cleanBasket(){
    this.basketservice.emptyBasket(this.mail).subscribe(data => {
      this.loadBasket();
    });
       
  }
  removeitem(product_code){
    this.basketservice.removeItem(this.mail,product_code).subscribe(data=>{
      this.loadBasket();
    });
     
  }
}
