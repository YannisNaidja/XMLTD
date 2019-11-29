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
  private products : Product[] = new Array();
  
  constructor(private productsService : ProductsService) { }

  ngOnInit() {
      this.productsService.getProducts().subscribe(p => {
	  this.products = p;
	  console.log(this.products);
    });
  }
}
