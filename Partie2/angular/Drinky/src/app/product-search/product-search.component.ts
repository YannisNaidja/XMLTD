import { Component, OnInit, EventEmitter, Output } from '@angular/core';
import { ProductsService } from '../products.service';

@Component({
  selector: 'product-search',
  templateUrl: './product-search.component.html',
  styleUrls: ['./product-search.component.css']
})
export class ProductSearchComponent implements OnInit {

  private Displayfullbar : boolean = false;
  private EmptyResults : boolean = false;
  private DisplayResults : boolean = false;
  // TODO: Create product object
  private product = {
    category : '',
    name : '',
    pricemin : 0,
    pricemax : undefined,
    brand : '',
    type : '',
    extra : '',
  };

  @Output() private searchPerformed : EventEmitter<any> = new EventEmitter();
   
  constructor(private productservice : ProductsService) { }

  ngOnInit() {
  }

  reset(){
    this.Category = "";
    this.Productname ="*";
    this.Prixmin = "*";
    this.Prixmax ="*";
    this.Brand ="*";
    this.Type ="*";
    this.Extra ="*";
    
    this.Displayfullbar = false;
    this.DisplayResults = false;
  }

  DisplaySearch(){
  
    this.DisplayResults = false;
    this.Displayfullbar = true;
    console.log("la categorie dans displaysearch vaut"+this.Category);
    
  }
  Research(){
    this.EmptyResults = false;
    
    if(this.Category == ""){
      console.log("categorie vide");
    } else{
      console.log("empty result:" +this.EmptyResults+"fullbar:"+this.Displayfullbar+"result:" +this.DisplayResults);
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
	if(this.product.length === 0){
	  this.EmptyResults = true;
	}
	this.Displayfullbar = false;
	this.DisplayResults = true;
	this.searchPerformed.emit(this.product);
      });
    }
  }
}
