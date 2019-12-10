import { Component, OnInit, EventEmitter, Output } from '@angular/core';
import { ProductsService } from '../products.service';

@Component({
  selector: 'product-search',
  templateUrl: './product-search.component.html',
  styleUrls: ['./product-search.component.css']
})
export class ProductSearchComponent implements OnInit {
  private selectCategoryState : boolean = false;
  private product : any = {};

  @Output() private searchPerformed : EventEmitter<any> = new EventEmitter();
  
  constructor(private productservice : ProductsService) {
    this.reset();
  }

  ngOnInit() {
    // Does nothing on init
  }

  reset(){
    this.product = {
      category : '',
      name : '',
      pricemin : 0,
      pricemax : undefined,
      brand : '',
      type : '',
      extra : '',
    };
  }

  Research(){
    let category = this.product.category;
    
    if (category.length === 0) {
      category = '*';
    }

    let name = this.product.name;

    if (name.length === 0) {
      name = '*';
    }

    let pricemax = this.product.pricemax;

    if (pricemax === undefined) {
      pricemax = '*';
    }

    let brand = this.product.brand;
    
    if (brand.length === 0) {
      brand = '*';
    }

    let type = this.product.type;
    
    if (type.length === 0) {
      type = '*';
    }

    let extra = this.product.extra;
    
    if (extra.length === 0) {
      extra = '*';
    }
    
    this.productservice.Research(category, name, this.product.pricemin, pricemax, brand, type, extra).subscribe(product => {
      this.product = product;
      this.searchPerformed.emit(this.product);
    });
  }

  toggleDisplay() {
    if (this.selectCategoryState) {
      this.reset();
    }
    
    this.selectCategoryState = ! this.selectCategoryState;
  }
}
