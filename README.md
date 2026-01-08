# El Mexiquense Market Website

Esta maqueta está enfocada en presentar promociones destacadas, una sección hero y un bloque especial para la "Canasta de frutas". El diseño usa tipografía Poppins, botones en verde y rojo característicos de la marca, y un carrusel horizontal accesible optimizado para móvil.

## Características clave
- Carrusel de tarjetas con botones de navegación verdes centrados y visibles en móviles.
- Tarjetas promocionales con botón de llamada a la acción alineado al centro y sin recortes en pantallas pequeñas.
- Sección destacada para la canasta de frutas con lista de beneficios y llamados a la acción.
- Enlace auxiliar `web.html` que redirige automáticamente a `index.html` para evitar errores 404.
- **🔥 Integración con Firebase** para analytics y servicios futuros.

## Firebase Integration

El sitio web ahora incluye Firebase para:
- **Analytics**: Seguimiento automático de visitas y eventos
- **Hosting**: Despliegue en Firebase Hosting con CDN global
- **Servicios futuros**: Autenticación, base de datos, almacenamiento, etc.

Ver [FIREBASE_README.md](FIREBASE_README.md) para más detalles sobre la implementación de Firebase.

## Deployment (Despliegue)

### Despliegue a Firebase Hosting

El sitio está configurado para desplegarse a Firebase Hosting. Para desplegar:

```bash
# 1. Asegúrate de tener Firebase CLI instalado
npm install -g firebase-tools

# 2. Inicia sesión en Firebase
firebase login

# 3. Despliega el sitio
firebase deploy

# O usa el script automatizado
./deploy.sh
```

Ver [FIREBASE_DEPLOYMENT.md](FIREBASE_DEPLOYMENT.md) para instrucciones detalladas de despliegue.

**URLs de producción:**
- https://mexiquenseweb-4931b.web.app
- https://mexiquenseweb-4931b.firebaseapp.com

## Desarrollo
Todo el estilo se encuentra incrustado en `index.html`. No se requieren dependencias externas para previsualizar la página: basta con abrir el archivo en un navegador.

### Instalación de dependencias (opcional)
```bash
npm install
```

### Testing local
```bash
# Opción 1: Python
python3 -m http.server 8080

# Opción 2: Node.js (npx)
npx serve

# Luego abre http://localhost:8080 en tu navegador
```
