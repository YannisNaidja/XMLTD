import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { BasketService } from '../basket.service';
import { AuthenticationService } from '../authentication.service';

@Component({
  selector: 'basket',
  templateUrl: './basket.component.html',
  styleUrls: ['./basket.component.css']
})
export class BasketComponent implements OnInit {

  private basket : any[] = new Array();
  private member : any;
  
  

  constructor(private  basketservice : BasketService, authentication : AuthenticationService) { 
   this.member = authentication.getMember();
   console.log(this.member);
  }

  ngOnInit() {

  }
loadBasket(){
  console.log(this.member.value.mail);
  this.basketservice.getBasket(this.member.value.mail).subscribe(b => {
    this.basket = b;
    
    });
  }
}
