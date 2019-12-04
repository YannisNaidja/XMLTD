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
      });
  }
}
