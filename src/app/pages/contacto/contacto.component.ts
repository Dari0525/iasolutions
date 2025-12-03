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
  isSubmitting = false;

  onSubmit() {
    this.isSubmitting = true;
    this.formSubmitted = true;

    // Scroll al inicio para evitar que el usuario quede al final de la página
    try {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    } catch (_) {}

    // Envío mediante FormSubmit (AJAX) sin backend
    const endpoint = 'https://formsubmit.co/ajax/iacolombia@icloud.com';
    const payload = {
      Nombre: this.formData.nombre,
      Correo: this.formData.email,
      Telefono: this.formData.telefono,
      'Tipo de seguro': this.formData.tipoSeguro || 'No especificado',
      Mensaje: this.formData.mensaje,
      _subject: `Contacto web - ${this.formData.nombre} (${this.formData.tipoSeguro || 'Interés general'})`,
      _template: 'box'
    };

    fetch(endpoint, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify(payload)
    })
    .then(async (res) => {
      if (!res.ok) throw new Error(await res.text());
      return res.json();
    })
    .then(() => {
      // Éxito: mantener feedback de enviado
      this.formSubmitted = true;
    })
    .catch((err) => {
      console.error('Error enviando correo:', err);
      // En caso de error, mostrar feedback en botón
      this.formSubmitted = false;
      alert('No fue posible enviar tu mensaje en este momento. Intenta nuevamente más tarde.');
    })
    .finally(() => {
      // Resetear formulario después de 3 segundos
      setTimeout(() => {
        this.isSubmitting = false;
        this.formSubmitted = false;
        this.formData = {
          nombre: '',
          email: '',
          telefono: '',
          tipoSeguro: '',
          mensaje: ''
        };
      }, 3000);
    });

  }
}
