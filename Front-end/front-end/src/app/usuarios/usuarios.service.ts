import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import {Observable} from 'rxjs';
import { environment } from 'src/environments/environment';
import { usuarioCreacionDTO, usuarioDTO } from './usuario';


@Injectable({
  providedIn: 'root'
})
export class UsuariosService {

  constructor(private http: HttpClient) { }

  private apiURL = environment.apiURL + 'usuarios';

  public obtenerTodos(): Observable<usuarioDTO[]>{
    return this.http.get<usuarioDTO[]>(this.apiURL)
  }

  public crear(usuario: usuarioCreacionDTO){
    console.log("envio usuario desde service", usuario)
    return this.http.post(this.apiURL, usuario);
  }
}
