import { Component, OnInit } from '@angular/core';
import { ProductsService } from '../products.service';
import { Product } from '../product';
import { AbstractProduct } from '../abstract-product';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  private products : Product[] = new Array();
  
  constructor(private productsService : ProductsService) { }

  ngOnInit() {
      this.productsService.getProducts().subscribe(products => {
      	  for (let product of products) {
      	      products.push(AbstractProduct.createProduct(product));
      	  }
	  this.products = products;
    });
  }
}
