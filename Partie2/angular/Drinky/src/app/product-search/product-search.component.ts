import { Component, OnInit } from '@angular/core';
import { ProductsService } from '../products.service';

@Component({
  selector: 'app-product-search',
  templateUrl: './product-search.component.html',
  styleUrls: ['./product-search.component.css']
})
export class ProductSearchComponent implements OnInit {

  private DisplayCatchoice : boolean = true;
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
   private Product : any = [] ;
     
   
  constructor(private productservice : ProductsService) { }

  ngOnInit() {
  }

  DisplaySearch(){
    this.DisplayCatchoice = false;
    this.Displayfullbar = true;

  }
  Research(){
    this.EmptyResults = false;
    if(this.Category == ""){
      console.log("categorie vide");
    }
    else{
      this.productservice.Research(this.Category,this.Productname,this.Prixmin,this.Prixmax,
        this.Brand,this.Type,this.Extra).subscribe(product => {
          this.Product = product;
          if(this.Product.length === 0){
            this.EmptyResults = true;
          }
          this.Displayfullbar = false;
          this.DisplayCatchoice = true;
        });
      
    }
    
  }
}
