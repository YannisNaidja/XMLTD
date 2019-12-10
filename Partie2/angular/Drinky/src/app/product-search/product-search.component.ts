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
  private Category : string = "";
  private Productname : string = "*"
  private Prixmin : string ="*";
  private Prixmax : string ="*";
  private Brand : string ="*";
  private Type : string ="*";
  private Extra : string ="*";
  private product : any = [] ;
  @Output() private searchPerformed : EventEmitter<any> = new EventEmitter();
   
  constructor(private productservice : ProductsService) { }

  ngOnInit() {
  }

  reset(){
    this.Category = "";
    this.Displayfullbar = false;
    this.DisplayResults = false;
  }

  DisplaySearch(){
  
    this.DisplayResults = false;
    this.Displayfullbar = true;

  }
  Research(){
    this.EmptyResults = false;
    if(this.Category == ""){
      console.log("categorie vide");
    }
    else{
      console.log("empty result:" +this.EmptyResults+"fullbar:"+this.Displayfullbar+"result:" +this.DisplayResults);
      this.productservice.Research(this.Category,this.Productname,this.Prixmin,this.Prixmax,
				   this.Brand,this.Type,this.Extra).subscribe(product => {
				     
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
