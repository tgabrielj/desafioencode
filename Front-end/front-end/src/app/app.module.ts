import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { ListadoUsuariosComponent } from './usuarios/listado-usuarios/listado-usuarios.component';
import { ListadoActividadesComponent } from './actividades/listado-actividades/listado-actividades.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './material/material.module';
import { MenuComponent } from './menu/menu.component';
import { AppRoutingModule } from './app-routing.module';
import { CrearUsuarioComponent } from './usuarios/crear-usuario/crear-usuario.component';
import { EditarUsuarioComponent } from './usuarios/editar-usuario/editar-usuario.component';
import { ReactiveFormsModule } from '@angular/forms';
import { FormularioUsuarioComponent } from './usuarios/formulario-usuario/formulario-usuario.component';
import { ContactarPipe } from './pipes/contactar.pipe';
import { SweetAlert2Module } from '@sweetalert2/ngx-sweetalert2';
import { ConsultarUsuarioComponent } from './usuarios/consultar-usuario/consultar-usuario.component';


@NgModule({
  declarations: [
    AppComponent,
    ListadoUsuariosComponent,
    CrearUsuarioComponent,
    ListadoActividadesComponent,
    MenuComponent,
    EditarUsuarioComponent,
    FormularioUsuarioComponent,
    ContactarPipe,
    ConsultarUsuarioComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    MaterialModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    SweetAlert2Module.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
