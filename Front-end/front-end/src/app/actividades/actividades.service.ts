import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import {Observable} from 'rxjs';
import { environment } from 'src/environments/environment';
import { actividadCreacionDTO, actividadDTO } from './actividad';


@Injectable({
  providedIn: 'root'
})
export class ActividadesService {

  constructor(private http: HttpClient) { }

  private apiURL = environment.apiURL + 'actividades';

  public obtenerTodos(): Observable<actividadDTO[]>{
    return this.http.get<actividadDTO[]>(this.apiURL)
  }

  public crearActividad(actividad: actividadCreacionDTO){

    return this.http.post(this.apiURL, actividad);

  }



}
