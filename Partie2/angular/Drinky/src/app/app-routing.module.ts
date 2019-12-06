import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProductsComponent } from './products/products.component';
import { ProductDetailsComponent } from './product-details/product-details.component';
import { AuthenticationComponent } from './authentication/authentication.component';
import { RegistrationComponent } from './registration/registration.component';

const routes: Routes = [{
    path : 'products',
    component : ProductsComponent
}, {
    path : 'products/:code',
    component : ProductDetailsComponent
}, {
    path : 'login',
    component : AuthenticationComponent
}, {
    path : 'registration',
    component : RegistrationComponent
}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
