import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProductsComponent } from './products/products.component';
import { AuthenticationComponent } from './authentication/authentication.component';
import { ConnexionComponent} from './connexion/connexion.component';
const routes: Routes = [{
    path : 'products',
    component : ProductsComponent
}, {
    path : 'login',
    component : AuthenticationComponent
}, {
  path : 'connexion',
  component : ConnexionComponent
}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
