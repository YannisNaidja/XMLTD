import { Component, OnInit, EventEmitter, Output } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ProductsService } from '../products.service';
import { BrandsServiceService } from '../brands-service.service';
import { TypesService } from '../types.service';

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
  private brands : any = [];
  private types : any = [];
  
  @Output() private searchPerformed : EventEmitter<any> = new EventEmitter();
  
  constructor(private productService : ProductsService,
	      private brandsService : BrandsServiceService,
	      private typesService : TypesService) {
    this.reset();
  }

  ngOnInit() {
    this.brandsService.getBrands().subscribe(brands => {
      this.brands = brands;
    });

    this.typesService.getTypes().subscribe(types => {
      this.types = types;
    });
  }

  reset(){
    this.fields = {
      category : 'ALL',
      name : '',
      pricemin : 0,
      pricemax : undefined,
      brand : 'ALL',
      type : 'ALL'
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
    
    if (brand === 'ALL') {
      brand = '*';
    }

    let type = this.fields.type;
    
    if (type === 'ALL') {
      type = '*';
    }

    this.productService.searchProducts(category, name, this.fields.pricemin, pricemax, brand, type).subscribe(products => {
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
