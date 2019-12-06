import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProductsComponent } from './products/products.component';
import { AuthenticationComponent } from './authentication/authentication.component';
import { RegistrationComponent } from './registration/registration.component';
import {BasketComponent} from './basket/basket.component';

const routes: Routes = [{
    path : 'products',
    component : ProductsComponent
}, {
    path : 'login',
    component : AuthenticationComponent
}, {
    path : 'registration',
    component : RegistrationComponent
},
{   path : 'basket',
    component : BasketComponent
}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
