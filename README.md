# El Mexiquense Market Website

Esta maqueta está enfocada en presentar promociones destacadas, una sección hero y un bloque especial para la "Canasta de frutas". El diseño usa tipografía Poppins, botones en verde y rojo característicos de la marca, y un carrusel horizontal accesible optimizado para móvil.

## 🚀 Deploy Rápido

**¿Primera vez? Lee esto primero:** [RESUMEN_COMPLETO.md](RESUMEN_COMPLETO.md) ⭐

```bash
# 3 comandos para publicar tu sitio
firebase login
firebase use mexiquenseweb-4931b
firebase deploy --only hosting
```

**URLs del sitio:**
- https://mexiquenseweb-4931b.web.app
- https://mexiquenseweb-4931b.firebaseapp.com

## 📚 Documentación

| Documento | Descripción |
|-----------|-------------|
| **[INDICE_DOCUMENTACION.md](INDICE_DOCUMENTACION.md)** | 📖 Índice completo de toda la documentación |
| **[RESUMEN_COMPLETO.md](RESUMEN_COMPLETO.md)** | ⭐ **EMPIEZA AQUÍ** - Responde las 5 preguntas principales |
| **[COMANDOS_RAPIDOS.md](COMANDOS_RAPIDOS.md)** | ⚡ Referencia rápida de comandos |
| **[GUIA_COMPLETA_DEPLOYMENT.md](GUIA_COMPLETA_DEPLOYMENT.md)** | 📝 Guía paso a paso detallada |
| **[EXPLICACION_ARCHIVOS.md](EXPLICACION_ARCHIVOS.md)** | 📂 Qué archivos necesitas y por qué |
| **[CHECKLIST_VERIFICACION.md](CHECKLIST_VERIFICACION.md)** | ✅ Cómo verificar que todo funcione |

## Características clave
- Carrusel de tarjetas con botones de navegación verdes centrados y visibles en móviles.
- Tarjetas promocionales con botón de llamada a la acción alineado al centro y sin recortes en pantallas pequeñas.
- Sección destacada para la canasta de frutas con lista de beneficios y llamados a la acción.
- Enlace auxiliar `web.html` que redirige automáticamente a `index.html` para evitar errores 404.
- **🔥 Integración con Firebase** para analytics y servicios futuros.

## Firebase Integration

El sitio web ahora incluye Firebase para:
- **Analytics**: Seguimiento automático de visitas y eventos
- **Hosting**: Despliegue en Firebase Hosting con CDN global y SSL gratuito
- **Servicios futuros**: Autenticación, base de datos, almacenamiento, etc.

**Configuración actual:**
- ✅ `firebase.json` - Configurado con `"public": "."`
- ✅ `.firebaserc` - Conectado a proyecto `mexiquenseweb-4931b`
- ✅ Archivos del sitio listos para deployment

## Deployment (Despliegue)

### Opción 1: Script Automatizado (RECOMENDADO)

```bash
./deploy.sh
```

El script verifica todo y deploya automáticamente.

### Opción 2: Comandos Manuales

```bash
# 1. Instalar Firebase CLI (solo primera vez)
npm install -g firebase-tools

# 2. Autenticarse
firebase login

# 3. Conectar al proyecto
firebase use mexiquenseweb-4931b

# 4. Publicar
firebase deploy --only hosting
```

### Verificar Deployment

Después del deploy:
1. Abre: https://mexiquenseweb-4931b.web.app
2. Verifica que no diga "Site not found"
3. Revisa que imágenes y navegación funcionen
4. Consulta [CHECKLIST_VERIFICACION.md](CHECKLIST_VERIFICACION.md) para verificación completa

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
