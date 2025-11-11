import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-contacto',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './contacto.component.html',
  styleUrl: './contacto.component.css'
})
export class ContactoComponent {
  formData = {
    nombre: '',
    email: '',
    telefono: '',
    tipoSeguro: '',
    mensaje: ''
  };

  formSubmitted = false;

  onSubmit() {
    // Aquí se puede integrar con un servicio de email o backend
    console.log('Formulario enviado:', this.formData);
    this.formSubmitted = true;
    
    // Resetear formulario después de 3 segundos
    setTimeout(() => {
      this.formSubmitted = false;
      this.formData = {
        nombre: '',
        email: '',
        telefono: '',
        tipoSeguro: '',
        mensaje: ''
      };
    }, 3000);
  }
}
