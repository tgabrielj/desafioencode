import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { ListadoActividadesComponent } from "./actividades/listado-actividades/listado-actividades.component";
import { CrearUsuarioComponent } from "./usuarios/crear-usuario/crear-usuario.component";
import { EditarUsuarioComponent } from "./usuarios/editar-usuario/editar-usuario.component";
import { ListadoUsuariosComponent } from "./usuarios/listado-usuarios/listado-usuarios.component";

const routes: Routes = [
  {path: '', component: ListadoUsuariosComponent},
  {path: 'usuarios', component:ListadoUsuariosComponent},
  {path: 'actividades', component: ListadoActividadesComponent},
  {path: 'usuarios/crear', component: CrearUsuarioComponent},
  {path: 'usuarios/editar/:id', component: EditarUsuarioComponent},
  {path: '**', redirectTo:''}
];

@NgModule({
  imports : [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule { }
