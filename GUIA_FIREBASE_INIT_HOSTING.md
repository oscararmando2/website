# 🔥 Guía de Inicialización de Firebase Hosting

Esta guía te explica cómo conectar los archivos de tu proyecto local al proyecto de Firebase y configurar Firebase Hosting desde cero.

---

## 📋 Contenido

1. [Conectar archivos locales a Firebase](#1-conectar-archivos-locales-a-firebase)
2. [Proceso de inicialización](#2-proceso-de-inicialización)
3. [Archivos de configuración](#3-archivos-de-configuración-creados)
4. [Realizar implementaciones](#4-realizar-implementaciones-en-tu-sitio)
5. [URLs del sitio desplegado](#5-urls-del-sitio-desplegado)

---

## 1. Conectar archivos locales a Firebase

Para conectar los archivos de tu proyecto local al proyecto de Firebase, ejecuta el siguiente comando desde la raíz del directorio del proyecto local:

```bash
firebase init hosting
```

Este comando iniciará un proceso interactivo que te guiará a través de la configuración de Firebase Hosting para tu proyecto.

---

## 2. Proceso de inicialización

Durante la inicialización del proyecto, desde los mensajes de Firebase CLI:

### 2.1 Selecciona un proyecto de Firebase

Selecciona un proyecto de Firebase para conectar al directorio del proyecto local.

- El proyecto de Firebase seleccionado es el proyecto de Firebase **"predeterminado"** para el directorio del proyecto local.
- Para conectar proyectos adicionales de Firebase al directorio del proyecto local, configura alias de proyectos.

**En este proyecto:**
- Proyecto predeterminado: `mexiquenseweb-4931b`

### 2.2 Especifica el directorio raíz público

Especifica un directorio para usar como directorio raíz público.

Este contiene todos los archivos estáticos entregados públicamente, incluido el archivo `index.html` y otros elementos que desees implementar en Firebase Hosting.

#### Opciones de configuración:

**Opción 1: Usar directorio raíz (configuración actual)**
- Configuración: `"public": "."`
- Todos los archivos están en el directorio raíz del proyecto
- No se necesita carpeta `public/` separada

**Opción 2: Usar carpeta public**
- Configuración predeterminada: `"public": "public"`
- Todos los archivos del sitio van dentro de la carpeta `public/`
- Firebase creará automáticamente la carpeta si no existe

#### Notas importantes:

- Puedes especificar el directorio raíz público ahora o hacerlo más tarde en el archivo de configuración `firebase.json`.
- Si seleccionas la configuración predeterminada y aún no tienes un directorio denominado `public`, Firebase lo creará automáticamente.
- Si aún no tienes un archivo `index.html` o `404.html` válido en el directorio raíz público, Firebase los creará por ti.

### 2.3 Configuración para el sitio

Crea una configuración para el sitio.

**Si seleccionas crear una app de una página (SPA):**
- Firebase agrega automáticamente las configuraciones de reescritura para ti.
- Todas las rutas se redirigirán a `index.html`
- Esto permite que tu aplicación maneje el routing del lado del cliente

**Configuración típica de SPA en `firebase.json`:**
```json
{
  "hosting": {
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

---

## 3. Archivos de configuración creados

Al final de la inicialización, Firebase crea y agrega automáticamente dos archivos a la raíz del directorio de la app local:

### 3.1 `firebase.json`

Un archivo de configuración que contiene la configuración de tu proyecto.

**Configuración actual de este proyecto:**

```json
{
  "hosting": {
    "public": ".",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**",
      "package.json",
      "package-lock.json",
      "firebase-config.js",
      "FIREBASE_README.md",
      "FIREBASE_SUMMARY.md",
      "firebase-test.html"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ],
    "headers": [
      {
        "source": "**/*.@(jpg|jpeg|gif|png|svg|webp)",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "max-age=604800"
          }
        ]
      },
      {
        "source": "**/*.@(js|css)",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "max-age=604800"
          }
        ]
      }
    ]
  }
}
```

**Componentes clave:**

- **`public`**: Directorio que contiene los archivos para publicar
- **`ignore`**: Lista de archivos/carpetas que no se subirán
- **`rewrites`**: Reglas de redirección para SPA
- **`headers`**: Configuración de caché y otros encabezados HTTP

📖 **Obtén más detalles sobre este archivo en la página [Configura el comportamiento del hosting](https://firebase.google.com/docs/hosting/full-config).**

### 3.2 `.firebaserc`

Un archivo en el que se almacenan los alias de tu proyecto.

**Configuración actual de este proyecto:**

```json
{
  "projects": {
    "default": "mexiquenseweb-4931b"
  }
}
```

Este archivo identifica qué proyecto de Firebase se usará para el deployment.

---

## 4. Realizar implementaciones en tu sitio

Para realizar implementaciones en tu sitio, ejecuta el siguiente comando desde la raíz del directorio del proyecto local:

```bash
firebase deploy --only hosting
```

### 📝 Nota importante:

Cuando ejecutas este comando con la marca `--only hosting`, **solo implementarás el contenido y la configuración de Hosting**.

### Opciones de deployment:

**Opción 1: Deploy solo hosting (recomendado)**
```bash
firebase deploy --only hosting
```

**Opción 2: Deploy múltiples servicios**
```bash
firebase deploy --only hosting,functions
```

Si también deseas implementar otros recursos o configuraciones del proyecto (como funciones o reglas de bases de datos), ejecuta este comando con una lista separada por comas en la marca.

Ejemplo:
```bash
firebase deploy --only hosting,functions,firestore,storage
```

**Opción 3: Deploy completo**
```bash
firebase deploy
```
Esto desplegará todos los servicios configurados en tu proyecto.

### Script de deployment automatizado

Este proyecto incluye un script de deployment automatizado:

```bash
./deploy.sh
```

El script verifica:
- ✅ Instalación de Firebase CLI
- ✅ Autenticación
- ✅ Archivos necesarios
- ✅ Ejecuta el deployment

---

## 5. URLs del sitio desplegado

Con el comando de deployment, se implementa tu contenido y configuración de Hosting en los siguientes subdominios aprovisionados por Firebase:

### URLs de este proyecto:

- **URL principal:** `https://mexiquenseweb-4931b.web.app`
- **URL alternativa:** `https://mexiquenseweb-4931b.firebaseapp.com`

### Formato general:

- **Formato 1:** `https://PROJECT_ID.web.app`
- **Formato 2:** `https://PROJECT_ID.firebaseapp.com`

Donde `PROJECT_ID` es el ID de tu proyecto Firebase (en este caso: `mexiquenseweb-4931b`).

### Características de las URLs:

- ✅ **SSL/HTTPS automático**: Certificado SSL gratuito y automático
- ✅ **CDN global**: Entrega rápida de contenido en todo el mundo
- ✅ **Alta disponibilidad**: Infraestructura confiable de Firebase
- ✅ **Dominio personalizado**: Puedes configurar tu propio dominio más adelante

---

## 🎯 Resumen del proceso completo

```bash
# 1. Instalar Firebase CLI (solo primera vez)
npm install -g firebase-tools

# 2. Autenticarse con Firebase
firebase login

# 3. Inicializar Firebase Hosting
firebase init hosting

# Durante la inicialización:
# - Seleccionar proyecto: mexiquenseweb-4931b
# - Directorio público: . (punto para raíz)
# - Configurar como SPA: y (yes)
# - Sobrescribir index.html: n (no, si ya existe)

# 4. Conectar al proyecto (si no se hizo en init)
firebase use mexiquenseweb-4931b

# 5. Desplegar el sitio
firebase deploy --only hosting

# 6. Verificar en el navegador
# https://mexiquenseweb-4931b.web.app
```

---

## 📚 Documentación relacionada

Para más información sobre este proyecto, consulta:

- **[RESUMEN_COMPLETO.md](RESUMEN_COMPLETO.md)** - Respuestas a las 5 preguntas principales
- **[GUIA_COMPLETA_DEPLOYMENT.md](GUIA_COMPLETA_DEPLOYMENT.md)** - Guía paso a paso detallada
- **[EXPLICACION_ARCHIVOS.md](EXPLICACION_ARCHIVOS.md)** - Explicación de todos los archivos
- **[COMANDOS_RAPIDOS.md](COMANDOS_RAPIDOS.md)** - Referencia rápida de comandos
- **[CHECKLIST_VERIFICACION.md](CHECKLIST_VERIFICACION.md)** - Verificación post-deployment

---

## 🔗 Enlaces útiles

### Firebase Console
- **Overview:** https://console.firebase.google.com/project/mexiquenseweb-4931b/overview
- **Hosting:** https://console.firebase.google.com/project/mexiquenseweb-4931b/hosting
- **Analytics:** https://console.firebase.google.com/project/mexiquenseweb-4931b/analytics

### Documentación oficial
- **Firebase Hosting:** https://firebase.google.com/docs/hosting
- **Configuración de Hosting:** https://firebase.google.com/docs/hosting/full-config
- **Firebase CLI:** https://firebase.google.com/docs/cli

---

## ✅ Estado actual del proyecto

| Componente | Estado | Notas |
|------------|--------|-------|
| Firebase CLI | ⚠️ Verificar | Ejecutar `firebase --version` |
| Autenticación | ⚠️ Verificar | Ejecutar `firebase login` |
| `firebase.json` | ✅ Configurado | Listo para usar |
| `.firebaserc` | ✅ Configurado | Proyecto: mexiquenseweb-4931b |
| `index.html` | ✅ Presente | Página principal lista |
| Archivos del sitio | ✅ Presentes | Imágenes y contenido listo |
| Deployment | ⏳ Pendiente | Ejecutar `firebase deploy --only hosting` |

---

## 🚀 Próximo paso

Si ya tienes Firebase CLI instalado y estás autenticado, el siguiente paso es:

```bash
firebase deploy --only hosting
```

Luego visita: **https://mexiquenseweb-4931b.web.app**

---

**Última actualización:** Enero 2026  
**Proyecto:** El Mexiquense Market  
**Firebase Project ID:** mexiquenseweb-4931b
