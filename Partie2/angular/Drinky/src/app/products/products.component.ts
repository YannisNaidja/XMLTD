import { Component, OnInit, Input } from '@angular/core';
import { ProductsService } from '../products.service';
import { Router } from '@angular/router';
import { AuthenticationService } from '../authentication.service';
import { Observable } from 'rxjs';

@Component({
    selector: 'app-products',
    templateUrl: './products.component.html',
    styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
    private products : any[] = new Array();
    private productsByCategory : any = {};
    private categories : any = [];
    private currentCategory : any = false;
  private member : Observable<any>;
  private filter : any[] = new Array();
    
    constructor(private productsService : ProductsService,
		private authenticationService : AuthenticationService,
		private router : Router) {
    	this.member = this.authenticationService.getMember();
    }
    
    ngOnInit() {
	this.productsService.getProducts().subscribe(p => {
	  this.products = p;
	  console.log("les produit sonts"+JSON.stringify(this.products));
	    
	  this.sortAlphabetically();
	  this.sortByCategories();
	});
    }

  sortAlphabetically() {
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
  }
  
  sortByCategories() {
    this.productsByCategory = {};
    this.categories = [];
    
    for (let product of this.products) {
      console.log(product.category_code);
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

    console.log("la categorie vaut" +JSON.stringify(this.categories));
    this.productsService.currentcategory.subscribe(cat => this.currentCategory = cat);
  }
  
  viewDetails(code : string) {
    this.router.navigate(['/products/' + code ]);
  }
  
  connect(){
    this.router.navigate(['/login']);
  }

  onSearchPerformed(products : any) {
    this.products = products;
    console.log(this.products);
    this.sortAlphabetically();
    this.sortByCategories();

    console.log(this.productsByCategory);
  }
}
