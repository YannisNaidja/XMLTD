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
  private updatedbasket : any[] = new Array();
  private member : any;
  private empty : boolean;
  private displaymodify : boolean = false;
  private mail : any;
  private newQuantity : number = 0;

  constructor(private  basketservice : BasketService, 
              private authentication : AuthenticationService,
              private router : Router) { 
    this.member = authentication.getMember();
    this.mail = this.member.value.mail;
  }

  ngOnInit() {
    this.empty = true;
    
    this.basketservice.currentbasket.subscribe(b => {
      if(b !== undefined){
        this.basket =b;
        this.empty = false;
      }           
    });
  }
  
  cleanBasket(){
    this.basketservice.emptyBasket(this.mail).subscribe(b => {
      this.basket = b;
    });
  }
  
  removeitem(product_code){
    this.basketservice.removeItem(this.mail,product_code).subscribe(b => {
      this.basket = b;
    });   
  }

  triggerformModify() {
    this.displaymodify = true;
  }
  
  modifyquantity(product_code){
    this.basketservice.ModifiyBasket(this.mail,product_code,this.newQuantity).subscribe(b => {
      this.displaymodify = false;
      this.basket = b;
    });
  }
}
