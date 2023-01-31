import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'contactar'
})
export class ContactarPipe implements PipeTransform {

  transform(value: boolean): string {
    if(value == true){
      return "SI"
    }
    else{
      return "NO"
    }
  }

}
