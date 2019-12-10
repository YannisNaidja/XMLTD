import { Component, OnInit, EventEmitter, Output } from '@angular/core';
import { ProductsService } from '../products.service';

@Component({
  selector: 'product-search',
  templateUrl: './product-search.component.html',
  styleUrls: ['./product-search.component.css']
})
export class ProductSearchComponent implements OnInit {
  private selectCategoryState : boolean = false;
  private searchState = false;
  private fields : any = {};
  private emptyResultsState : boolean = false;
  
  @Output() private searchPerformed : EventEmitter<any> = new EventEmitter();
  
  constructor(private productService : ProductsService) {
    this.reset();
  }

  ngOnInit() {
    // Does nothing on init
  }

  reset(){
    this.fields = {
      category : 'ALL',
      name : '',
      pricemin : 0,
      pricemax : undefined,
      brand : '',
      type : '',
      extra : '',
    };
  }

  searchProducts(){
    let category = this.fields.category;

    if (category === 'ALL' || category.length === 0) {
      category = '*';
    }

    let name = this.fields.name;

    if (name.length === 0) {
      name = '*';
    }
    
    let pricemax = this.fields.pricemax;

    if (pricemax === undefined) {
      pricemax = '*';
    }

    let brand = this.fields.brand;
    
    if (brand.length === 0) {
      brand = '*';
    }

    let type = this.fields.type;
    
    if (type.length === 0) {
      type = '*';
    }

    let extra = this.fields.extra;
    
    if (extra.length === 0) {
      extra = '*';
    }

    this.productService.searchProducts(category, name, this.fields.pricemin, pricemax, brand, type, extra).subscribe(products => {
      this.emptyResultsState = false;
      
      if (products.length === 0) {
	this.emptyResultsState = true;
      } else {
	this.searchPerformed.emit(products);
	this.toggleDisplay();
	this.searchState = true;
      }
    });
  }

  toggleDisplay() {
    if (this.selectCategoryState) {
      this.reset();
    }
    
    this.selectCategoryState = ! this.selectCategoryState;
  }

  removeFilters() {
    this.searchPerformed.emit(undefined);
    this.searchState = false;
    this.emptyResultsState = false;
  }
}
