import { Component, OnInit } from '@angular/core';
import { ProductsService } from '../products.service';
import { Product } from '../product';
import { ProductFactory } from '../product-factory';

@Component({
    selector: 'app-products',
    templateUrl: './products.component.html',
    styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
    private products : any[] = new Array();
    private productsByCategory : any = {};
    private categories : any = [];
    
    constructor(private productsService : ProductsService) { }
    
    ngOnInit() {
	this.productsService.getProducts().subscribe(p => {
	    this.products = p;
	    
	    this.products.sort(function(a, b) {
		let initialA = a.product_name.toLowerCase()[0];
		let initialB = b.product_name.toLowerCase()[0];
		
		if (initialA < initialB) {
		    return -1;
		} else if (initialB < initialA) {
		    return 1;
		}
		
		return 0;
	    });

	    for (let product of this.products) {
		if (! (product.category_code in this.productsByCategory)) {
		    this.productsByCategory[product.category_code] = [];
		    this.categories.push({
			code : product.category_code,
			name : product.category_name
		    });
		}
		
		this.productsByCategory[product.category_code].push(product);
	    }

	    console.log(this.categories);
	});
    }

    loadCategory(categoryCode) {
	console.log(categoryCode);
    }
}
