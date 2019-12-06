import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute, Params } from '@angular/router';
import { ProductsService } from '../products.service';

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

    private basket : any = [];
    
    constructor(private route : ActivatedRoute,
		private productsService : ProductsService) { }

    ngOnInit() {
	this.route.params.subscribe((params : Params) => {
	    this.productsService.findByCode(params.code).subscribe(res => {
		this.product = res;
	    });
	});
    }

    quantityInBasket(productCode) {
	for (let item of basket) {
	    if (item.product_code === productCode) {
		return item.quantity;
	    }
	}

	return 0;
    }
}
