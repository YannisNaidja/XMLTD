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
    private product : any;
    
    constructor(private route : ActivatedRoute,
		private productsService : ProductsService) { }

    ngOnInit() {
	this.route.params.subscribe((params : Params) => {
	    this.productsService.findByCode(params.code).subscribe(res => {
		console.log(res);
		this.product = res;
	    });
	});
    }
}
