# 🚀 Guía Completa: Publicar Angular en Hostinger

## ✅ Paso 1: Build del Proyecto (COMPLETADO)

Ya hemos generado los archivos optimizados para producción. Los archivos están en:
```
C:\proyects\iaseguros\iaseguros-web\dist\iaseguros-web\browser\
```

**Archivos generados:**
- index.html
- main-7LWXOXAD.js (código de tu aplicación)
- polyfills-FFHMD2TL.js (compatibilidad de navegadores)
- styles-ATS6NBTD.css (estilos)
- favicon.ico
- .htaccess (configuración del servidor)

---

## 📋 Paso 2: Preparar archivos para subir

Necesitas subir **TODO el contenido** de la carpeta `browser`:
```
C:\proyects\iaseguros\iaseguros-web\dist\iaseguros-web\browser\
```

**IMPORTANTE:** Sube el CONTENIDO de la carpeta browser, no la carpeta en sí.

---

## 🌐 Paso 3: Acceder a Hostinger

### 3.1 Iniciar Sesión
1. Ve a https://www.hostinger.com
2. Haz clic en "Iniciar sesión"
3. Ingresa tus credenciales

### 3.2 Acceder al Administrador de Archivos (hPanel)
1. En el panel de Hostinger, haz clic en "Sitios web"
2. Selecciona tu dominio
3. Busca la opción "Administrador de archivos" o "File Manager"
4. Haz clic para abrir

---

## 📁 Paso 4: Subir archivos a Hostinger

### Opción A: Usando el Administrador de Archivos (Recomendado para principiantes)

1. **Navega a la carpeta public_html:**
   - En el File Manager, busca la carpeta `public_html`
   - Esta es la carpeta raíz de tu sitio web

2. **Limpia la carpeta (si hay archivos anteriores):**
   - Selecciona todos los archivos en `public_html`
   - Haz clic en "Eliminar" o "Delete"
   - Confirma la eliminación

3. **Sube los archivos:**
   - Haz clic en el botón "Cargar" o "Upload" (generalmente arriba a la derecha)
   - Selecciona TODOS los archivos de:
     ```
     C:\proyects\iaseguros\iaseguros-web\dist\iaseguros-web\browser\
     ```
   - **IMPORTANTE:** Selecciona los archivos DENTRO de browser, no la carpeta
   - Espera a que termine la carga (puede tardar unos minutos)

4. **Verifica que se subieron:**
   - Debes ver en `public_html`:
     - index.html
     - .htaccess
     - main-7LWXOXAD.js
     - polyfills-FFHMD2TL.js
     - styles-ATS6NBTD.css
     - favicon.ico

### Opción B: Usando FileZilla (FTP) - Para usuarios avanzados

1. **Descargar FileZilla:**
   - Descarga desde: https://filezilla-project.org/
   - Instala el programa

2. **Obtener credenciales FTP de Hostinger:**
   - En hPanel de Hostinger, ve a "Cuentas FTP"
   - Anota:
     - Host/Servidor FTP
     - Usuario FTP
     - Contraseña FTP
     - Puerto (normalmente 21)

3. **Conectar con FileZilla:**
   - Abre FileZilla
   - Ingresa los datos FTP
   - Haz clic en "Conexión rápida"

4. **Transferir archivos:**
   - Panel izquierdo: navega a `C:\proyects\iaseguros\iaseguros-web\dist\iaseguros-web\browser\`
   - Panel derecho: navega a `/public_html/`
   - Selecciona TODOS los archivos del panel izquierdo
   - Arrastra al panel derecho
   - Espera a que termine la transferencia

---

## 🔧 Paso 5: Configurar el dominio (si es necesario)

### Si tu dominio NO apunta a public_html:

1. En hPanel de Hostinger, ve a "Dominios"
2. Selecciona tu dominio
3. Haz clic en "Configuración de DNS" o "Apuntar dominio"
4. Asegúrate de que apunte a la carpeta `public_html`

### Si usas un subdominio:

1. Crea un subdominio en hPanel
2. Asócialo con una carpeta específica
3. Sube los archivos a esa carpeta en lugar de public_html

---

## ✅ Paso 6: Verificar el archivo .htaccess

**MUY IMPORTANTE:** El archivo `.htaccess` ya fue creado automáticamente, pero verifica que esté en Hostinger:

1. En el File Manager, busca el archivo `.htaccess` en `public_html`
2. Si NO lo ves, asegúrate de que "Mostrar archivos ocultos" esté activado
3. El contenido debe ser:

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^index\.html$ - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.html [L]
</IfModule>
```

**¿Para qué sirve?** Este archivo hace que todas las rutas de Angular (/home, /productos, /contacto) funcionen correctamente en el servidor.

---

## 🎉 Paso 7: ¡Probar tu sitio!

1. Abre tu navegador
2. Visita tu dominio (ejemplo: www.tudominio.com)
3. Prueba todas las páginas:
   - Home: www.tudominio.com
   - Nosotros: www.tudominio.com/nosotros
   - Productos: www.tudominio.com/productos
   - Contacto: www.tudominio.com/contacto

---

## 🐛 Solución de Problemas Comunes

### Problema 1: Página en blanco
**Solución:**
- Verifica que todos los archivos se hayan subido correctamente
- Abre la consola del navegador (F12) y busca errores
- Asegúrate de que el archivo .htaccess esté presente

### Problema 2: Error 404 en las rutas
**Solución:**
- Verifica que el archivo .htaccess esté en public_html
- Asegúrate de que el contenido del .htaccess sea correcto
- En Hostinger, verifica que mod_rewrite esté habilitado

### Problema 3: Las imágenes no cargan
**Solución:**
- Las imágenes de Unsplash se cargan desde internet, así que necesitas conexión
- Verifica en la consola del navegador (F12) si hay errores de CORS

### Problema 4: Los estilos no se aplican
**Solución:**
- Limpia la caché del navegador (Ctrl + F5)
- Verifica que el archivo CSS se haya subido correctamente

### Problema 5: Error 500
**Solución:**
- Revisa el archivo .htaccess
- Contacta al soporte de Hostinger para verificar la configuración del servidor

---

## 🔄 Actualizaciones Futuras

Cuando hagas cambios en tu sitio:

1. **En tu computadora:**
   ```bash
   cd C:\proyects\iaseguros\iaseguros-web
   ng build --configuration production
   ```

2. **En Hostinger:**
   - Elimina los archivos antiguos de public_html
   - Sube los nuevos archivos de `dist/iaseguros-web/browser/`

---

## 📞 Soporte

Si tienes problemas:
1. **Hostinger Support:** https://www.hostinger.com/contact
2. **Chat en vivo:** Disponible en el panel de Hostinger
3. **Centro de ayuda:** https://support.hostinger.com

---

## 📝 Checklist Final

Antes de publicar, verifica:

- [ ] Build completado sin errores
- [ ] Archivo .htaccess creado
- [ ] Todos los archivos de dist/iaseguros-web/browser/ listos para subir
- [ ] Acceso a Hostinger funcionando
- [ ] Dominio configurado correctamente
- [ ] Carpeta public_html limpia y lista
- [ ] Archivos subidos completamente
- [ ] Sitio web probado en el navegador
- [ ] Todas las rutas funcionando
- [ ] Formulario de contacto probado
- [ ] Botón de WhatsApp funcionando

---

## 🎯 Resumen de Archivos a Subir

**Ubicación local:**
```
C:\proyects\iaseguros\iaseguros-web\dist\iaseguros-web\browser\
```

**Destino en Hostinger:**
```
/public_html/
```

**Archivos que debes ver en public_html:**
- index.html
- .htaccess
- main-7LWXOXAD.js
- polyfills-FFHMD2TL.js
- styles-ATS6NBTD.css
- favicon.ico

---

## ✨ ¡Tu sitio está listo!

Una vez completados todos los pasos, tu sitio web de IA Insurance Agency estará en línea con:
- ✅ Diseño moderno con contrastes oscuros
- ✅ Imágenes profesionales de Unsplash
- ✅ Efectos glassmorphism
- ✅ Formulario de contacto
- ✅ Integración con WhatsApp
- ✅ Responsive design
- ✅ Optimizado para producción

¡Felicidades! 🎉
