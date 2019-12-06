import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute, Params } from '@angular/router';
import { ProductsService } from '../products.service';
import { BasketService } from '../basket.service';
import { AuthenticationService } from '../authentication.service';

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

    private member : Observable<any>;
    private basket : any = [];
    private newQuantity : number = 0;
    
    constructor(private route : ActivatedRoute,
		private productsService : ProductsService,
		private basketService : BasketService,
		private authenticationService : AuthenticationService) { }

    ngOnInit() {
	this.member = this.authenticationService.getMember();
	
	this.route.params.subscribe((params : Params) => {
	    this.productsService.findByCode(params.code).subscribe(res => {
		this.product = res;
	    });
	});

	this.basketService.getBasket(this.member.value.mail).subscribe(res => {
	    this.basket = res;
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
	this.basketService.addBasket(/*this.member.value.mail*/ "jean.pierre@mail.com", this.product.code, this.newQuantity).subscribe(res => {
	    console.log(res);
	    this.basketService.getBasket(/*this.member.value.mail*/ "jean.pierre@mail.com").subscribe(res => {
		this.basket = res;
		console.log(this.basket);
	    });
	});
    }
}
