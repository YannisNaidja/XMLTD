import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProductsComponent } from './products/products.component';
import { AuthenticationComponent } from './authentication/authentication.component';

const routes: Routes = [{
    path : 'products',
    component : ProductsComponent
}, {
    path : 'login',
    component : AuthenticationComponent
}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
