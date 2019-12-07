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
    private newQuantity : number = 0;
    
    constructor(private route : ActivatedRoute,
		private productsService : ProductsService,
		private basketService : BasketService,
		private authenticationService : AuthenticationService,
		private router : Router) { }

    ngOnInit() {
	this.member = this.authenticationService.getMember();
	
	this.route.params.subscribe((params : Params) => {
	    this.productsService.findByCode(params.code).subscribe(res => {
		this.product = res;
	    });
	});

	this.basketService.getBasket(this.member).subscribe(res => {
		this.basket = res;
		console.log(this.basket);
	});
    }

    quantityInBasket(productCode) {
	for (let item of this.basket) {
	    if (item.product_code === productCode) {
		return item.quantity;
	    }
	}

	return 0;
    }

    onAddToBasketFormSubmit(productCode) {
	console.log(this.product.code);
	this.basketService.AddBasket(this.member.value.mail, this.product.code, this.newQuantity).subscribe(res => {
	    console.log(res);
	    this.basketService.getBasket(this.member.value.mail).subscribe(res => {
		this.basket = res;
		console.log(this.basket);
	    });
	});
	}
	backtolist(){
		this.router.navigate(['/products']);
	}
}
