import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { BasketService } from '../basket.service';
import { ProductsService } from '../products.service';
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
  private displaymodify : boolean = false;
  private mail : any;
  private newQuantity : number = 0;
  private productNames : any[] = new Array();
  
  constructor(private basketService : BasketService,
	      private productsService : ProductsService,
              private authentication : AuthenticationService,
              private router : Router) { 
    this.member = authentication.getMember();
    this.mail = this.member.value.mail;
  }

  ngOnInit() {
    this.basketService.updateBasket(this.member.value.mail);
    this.basket = this.basketService.getBasket();

    this.productsService.getProductNames().subscribe(names => {
      this.productNames = names;
    });
  }
  
  cleanBasket(){
    this.basketService.emptyBasket(this.mail).subscribe(b => {
      this.basketService.updateBasket(this.mail); 
    });
  }
  
  removeitem(product_code){
    this.basketService.delete(this.mail, product_code).subscribe(b => {
      this.basketService.updateBasket(this.mail); 
    });
  }

  triggerformModify() {
    this.displaymodify = true;
  }
  
  // TODO: _code -> Code
  modifyquantity(product_code){
    this.basketService.update(this.mail, product_code, this.newQuantity).subscribe(b => {
      this.basketService.updateBasket(this.member.value.mail);
    });
  }

  nameOf(productCode) {
    for (let entry of this.productNames) {
      if (entry.code === productCode) {
	return entry.name;
      }
    }
    
    return "Unkown product";
  }
}
