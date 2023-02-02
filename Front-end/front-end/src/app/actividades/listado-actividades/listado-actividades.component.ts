import { Component } from '@angular/core';
import { actividadDTO, actividadCreacionDTO } from '../actividad';
import { ActividadesService } from '../actividades.service';

@Component({
  selector: 'app-listado-actividades',
  templateUrl: './listado-actividades.component.html',
  styleUrls: ['./listado-actividades.component.css']
})
export class ListadoActividadesComponent {

  constructor(private actividadesService: ActividadesService){

  }

  actividades : actividadDTO[] = [];

  columnasAMostrar = ['Id Actividad','Fecha de Creacion', 'Id Usuario', 'Actividad'];
  
  ngOnInit(): void {

    this.actividades = [{

    id: 1,
    create_date: new Date(),
    id_usuario: 1,
    actividad: 'consulta de usuario',


    },
    {
    id: 2,
    create_date: new Date(),
    id_usuario: 4,
    actividad: 'actualizacion de usuario',
  }
  ]

  }
}


