import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ProductsComponent } from './products/products.component';
import { ProductDetailsComponent } from './product-details/product-details.component';
import { ProductsService } from './products.service';
import { AuthenticationComponent } from './authentication/authentication.component';
import { RegistrationComponent } from './registration/registration.component';
import { BasketComponent } from './basket/basket.component';
import { AuthenticationService } from './authentication.service';
import { BasketService } from './basket.service';
import { RegistrationService } from './registration.service';
import { ProductMenuComponent } from './product-menu/product-menu.component';
import { ProductSearchComponent } from './product-search/product-search.component';

@NgModule({
  declarations: [
    AppComponent,
    ProductsComponent,
    AuthenticationComponent,
    RegistrationComponent,
    ProductDetailsComponent,
    BasketComponent,
    ProductMenuComponent,
    ProductSearchComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [
    ProductsService,
    AuthenticationService,
    BasketService,
    RegistrationService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
