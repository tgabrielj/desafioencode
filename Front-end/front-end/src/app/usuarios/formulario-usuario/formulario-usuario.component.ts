import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import {Router} from '@angular/router';
import { usuarioCreacionDTO } from '../usuario';

@Component({
  selector: 'app-formulario-usuario',
  templateUrl: './formulario-usuario.component.html',
  styleUrls: ['./formulario-usuario.component.css']
})
export class FormularioUsuarioComponent {

  

  constructor(private router: Router, private formBuilder:FormBuilder){
  }

  form: FormGroup;

  @Input()
  modelo: usuarioCreacionDTO;

  @Output()
  submit : EventEmitter<usuarioCreacionDTO> = new EventEmitter<usuarioCreacionDTO>();

  ngOnInit():void{
    this.form = this.formBuilder.group({
      nombre: ['', {
        validators:[Validators.required, Validators.minLength(3)]
      }],
      apellido: ['', {
        validators:[Validators.required, Validators.minLength(3)]
      }],
      correo_electronico: ['', {
        validators:[Validators.required, Validators.minLength(3)]
      }],
      fecha_nacimiento: ['', {
        validators:[Validators.required, Validators.minLength(3)]
      }],
      telefono: ['', {
        validators:[Validators.required, Validators.minLength(3)]
      }],
      pais: ['', {
        validators:[Validators.required, Validators.minLength(3)]
      }],
      contactar: ['', {
        validators:[Validators.required]
      }]

    });

    
    if (this.modelo!== undefined){
      // machera los atributos del formulario con el modelo usuario
      this.form.patchValue(this.modelo)
    }
    
  }

  guardarCambios(){
    //form value se accede a la info del formulario
    this.submit.emit(this.form.value)
  
  }

  obtenerErrorCampoNombre(){
    var campo = this.form.get('nombre');

    if (campo.hasError('required')){
      return 'El campo nombre es requerido';
    }

    if (campo.hasError('minlength')){
      return 'La longitud minima es de 3 caracteres'
    }
    return '';
  }

  obtenerErrorCampoApellido(){
    var campo = this.form.get('apellido');

    if (campo.hasError('required')){
      return 'El campo apellido es requerido';
    }

    if (campo.hasError('minlength')){
      return 'La longitud minima es de 3 caracteres'
    }
    return '';
  }

}
