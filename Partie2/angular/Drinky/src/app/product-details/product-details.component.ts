import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute, Params } from '@angular/router';
import { ProductsService } from '../products.service';
import { BasketService } from '../basket.service';
import { AuthenticationService } from '../authentication.service';
import {Observable} from 'rxjs';
import { BasketComponent } from '../basket/basket.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrls: ['./product-details.component.css']
})
export class ProductDetailsComponent implements OnInit {
  private product : any = {
    product_name : '',
    price : 0,
    brand : '',
    type : '',
    extra : []
  };

  private member : any;
  private basket : any = [];
  private quantity : number = 1;
  
  constructor(private route : ActivatedRoute,
	      private productsService : ProductsService,
	      private basketService : BasketService,
	      private authenticationService : AuthenticationService,
	      private router : Router) {
    // Does nothing on object construction
  }

  ngOnInit() {
    this.member = this.authenticationService.getMember();
    
    this.route.params.subscribe((params : Params) => {
      this.productsService.findByCode(params.code).subscribe(res => {
	this.product = res;
      });
    });

    this.basketService.updateBasket(this.member.value.mail);
    this.basket = this.basketService.getBasket();
  }

  quantityInBasket(productCode : string) {
    for (let item of this.basket.value) {
      if (item.product_code === productCode) {
	return item.quantity;
      }
    }

    return 0;
  }

  onAddToBasketFormSubmit(productCode : string) {
    this.basketService.update(this.member.value.mail, this.product.code, this.quantity).subscribe(res => {
      this.basketService.updateBasket(this.member.value.mail);
    });
  }
  
  backtolist(){
    this.router.navigate(['/products']);
  }
}
