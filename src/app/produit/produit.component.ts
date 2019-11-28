import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { ProduitService } from '../produit.service';
import { Observable } from 'rxjs';



@Component({
  selector: 'app-produit',
  templateUrl: './produit.component.html',
  styleUrls: ['./produit.component.css']
})
export class ProduitComponent implements OnInit {

  private products : Object[] = new Array();


  constructor(private service : ProduitService) { }

  ngOnInit() {
    this.service.getProducts().subscribe(res => {this.products =res;});
  }

}
