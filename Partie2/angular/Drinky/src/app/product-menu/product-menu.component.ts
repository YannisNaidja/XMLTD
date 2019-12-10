import { Component, OnInit, ViewChild } from '@angular/core';
import { ProductsService } from '../products.service';
import { ProductsComponent } from '../products/products.component';
import { Router } from '@angular/router';

@Component({
  selector: 'product-menu',
  templateUrl: './product-menu.component.html',
  styleUrls: ['./product-menu.component.css']
})
export class ProductMenuComponent implements OnInit {
  private productsByCategory : any = {};
  private products : any[] = new Array();
  private categories : any = [];
  private currentCategory : any = false;

  constructor(private productservice : ProductsService,
	      private router : Router) { }

  ngOnInit() {
    this.productservice.getProducts().subscribe(p => {
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
            name : product.category_name,
            img : product.category_img
          });
	}
	
	this.productsByCategory[product.category_code].push(product);
      }
    });
  }

loadCategory(categoryCode : any) {
    if (typeof categoryCode === 'undefined') {
        categoryCode = false;
      }
    this.productservice.changecategory(categoryCode); 
    }
}
