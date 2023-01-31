import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { ListadoUsuariosComponent } from './usuarios/listado-usuarios/listado-usuarios.component';
import { ListadoActividadesComponent } from './actividades/listado-actividades/listado-actividades.component';
import { ListadoGenericoComponent } from './utilidades/listado-generico/listado-generico.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './material/material.module';
import { MenuComponent } from './menu/menu.component';
import { AppRoutingModule } from './app-routing.module';
import { CrearUsuarioComponent } from './usuarios/crear-usuario/crear-usuario.component';
import { EditarUsuarioComponent } from './usuarios/editar-usuario/editar-usuario.component';
import { ReactiveFormsModule } from '@angular/forms';
import { FormularioUsuarioComponent } from './usuarios/formulario-usuario/formulario-usuario.component';
import { ContactarPipe } from './pipes/contactar.pipe';


@NgModule({
  declarations: [
    AppComponent,
    ListadoUsuariosComponent,
    CrearUsuarioComponent,
    ListadoActividadesComponent,
    ListadoGenericoComponent,
    MenuComponent,
    EditarUsuarioComponent,
    FormularioUsuarioComponent,
    ContactarPipe
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    MaterialModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
