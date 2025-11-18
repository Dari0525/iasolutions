# 🚀 Guía para Publicar en GoDaddy

## 📦 Archivos que debes subir

Los archivos compilados están en la carpeta:
```
C:\proyects\iaseguros\iaseguros-web\dist\iaseguros-web\browser\
```

**IMPORTANTE:** Debes subir TODO el contenido de la carpeta `browser` (no la carpeta browser en sí, sino su contenido).

---

## 🔧 Pasos en cPanel de GoDaddy

### 1️⃣ Acceder al Administrador de Archivos

1. Inicia sesión en tu cPanel de GoDaddy
2. Busca y haz clic en **"Administrador de archivos"** (File Manager)

### 2️⃣ Limpiar la carpeta public_html

1. Navega a la carpeta `public_html`
2. **Elimina todos los archivos existentes** (incluyendo index.html, .htaccess, etc.)
   - Selecciona todos los archivos
   - Haz clic en "Delete" o "Eliminar"
   - Confirma la eliminación

### 3️⃣ Subir los archivos de Angular

**Opción A: Subir archivo por archivo** (No recomendado - muy lento)

**Opción B: Subir como ZIP** (✅ RECOMENDADO)

1. En tu computadora, ve a:
   ```
   C:\proyects\iaseguros\iaseguros-web\dist\iaseguros-web\browser\
   ```

2. **Selecciona TODO el contenido** de la carpeta `browser`:
   - Todos los archivos `.js`
   - El archivo `index.html`
   - El archivo `.htaccess`
   - La carpeta `assets` (si existe)
   - Todos los archivos CSS

3. **Haz clic derecho → Enviar a → Carpeta comprimida (ZIP)**
   - Nómbrala algo como `sitio-web.zip`

4. En cPanel, dentro de `public_html`:
   - Haz clic en **"Upload"** (Cargar/Subir)
   - Selecciona el archivo `sitio-web.zip`
   - Espera a que se suba completamente

5. Una vez subido:
   - Vuelve al Administrador de Archivos
   - Haz clic derecho sobre `sitio-web.zip`
   - Selecciona **"Extract"** (Extraer)
   - Confirma la extracción

6. **Elimina el archivo ZIP** después de extraerlo

### 4️⃣ Verificar la estructura de archivos

Asegúrate de que en `public_html` tengas:

```
public_html/
├── index.html
├── .htaccess
├── main-XXXXXXXX.js
├── polyfills-XXXXXXXX.js
├── styles-XXXXXXXX.css
├── favicon.ico
└── assets/ (si existe)
```

⚠️ **IMPORTANTE:** Los archivos deben estar directamente en `public_html`, NO dentro de una subcarpeta.

### 5️⃣ Configurar permisos del .htaccess

1. Ubica el archivo `.htaccess` en `public_html`
2. Haz clic derecho → **"Change Permissions"** (Cambiar permisos)
3. Establece los permisos en **644**
   - Read (4) + Write (2) = 6 para propietario
   - Read (4) para grupo
   - Read (4) para otros

---

## 🌐 Probar el sitio

1. Abre tu navegador
2. Ve a tu dominio: `https://tudominio.com`
3. El sitio debería cargar correctamente

### Verificar las rutas:
- `https://tudominio.com` → Home
- `https://tudominio.com/nosotros` → Página Nosotros
- `https://tudominio.com/productos` → Página Productos
- `https://tudominio.com/contacto` → Página Contacto

---

## 🔧 Solución de Problemas

### ❌ Error 404 en las rutas

**Problema:** Al acceder a `/nosotros` o cualquier ruta directamente, aparece error 404.

**Solución:**
1. Verifica que el archivo `.htaccess` existe en `public_html`
2. Verifica que los permisos del `.htaccess` son 644
3. En cPanel, ve a **"MultiPHP INI Editor"** o **"Select PHP Version"**
4. Asegúrate de que `mod_rewrite` esté habilitado

### ❌ Página en blanco

**Problema:** El sitio carga pero solo muestra una página en blanco.

**Solución:**
1. Presiona F12 en el navegador para abrir las herramientas de desarrollo
2. Ve a la pestaña "Console" (Consola)
3. Si ves errores 404 para archivos `.js` o `.css`:
   - Verifica que TODOS los archivos se subieron correctamente
   - Asegúrate de que los nombres de archivo con hash (main-XXXXX.js) existen

### ❌ Estilos no cargan (sitio sin colores)

**Problema:** El sitio carga pero sin estilos CSS.

**Solución:**
1. Verifica que el archivo `styles-XXXXXXXX.css` existe en `public_html`
2. Limpia la caché del navegador (Ctrl + Shift + Delete)
3. Recarga la página con Ctrl + F5

---

## 🔄 Para Actualizaciones Futuras

Cada vez que hagas cambios al sitio:

1. En tu computadora, ejecuta:
   ```powershell
   cd C:\proyects\iaseguros\iaseguros-web
   npm run build
   ```

2. Los nuevos archivos estarán en:
   ```
   C:\proyects\iaseguros\iaseguros-web\dist\iaseguros-web\browser\
   ```

3. En cPanel:
   - Elimina los archivos viejos de `public_html`
   - Sube los nuevos archivos (usando el método ZIP)

---

## 📞 Soporte

Si tienes problemas:
1. Contacta al soporte técnico de GoDaddy
2. Menciona que tienes una "Single Page Application (SPA) de Angular"
3. Pide que verifiquen que `mod_rewrite` esté habilitado

---

## ✅ Checklist Final

Antes de dar por terminado:

- [ ] Todos los archivos están en `public_html`
- [ ] El archivo `.htaccess` existe y tiene permisos 644
- [ ] `https://tudominio.com` carga correctamente
- [ ] Todas las rutas funcionan (nosotros, productos, contacto)
- [ ] Los estilos se ven correctamente
- [ ] Las imágenes cargan
- [ ] El formulario de contacto funciona
- [ ] El botón de WhatsApp funciona

---

## 🎉 ¡Listo!

Tu sitio web de IA Insurance Agency ya está publicado en GoDaddy.
