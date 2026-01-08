# 🚀 Guía Completa para Publicar el Sitio en Firebase Hosting

Esta guía te explica **EXACTAMENTE** cómo publicar tu sitio web "El Mexiquense Market" en Firebase Hosting.

---

## 1. 📁 Archivos que DEBES tener para publicar

Para que tu sitio funcione correctamente en Firebase Hosting, necesitas estos archivos:

### ✅ Archivos Obligatorios (YA LOS TIENES):

1. **`firebase.json`** - Configuración de Firebase Hosting
2. **`.firebaserc`** - Identifica tu proyecto Firebase (`mexiquenseweb-4931b`)
3. **`index.html`** - Tu página principal del sitio
4. **Carpeta `recetas/`** con su `index.html` - Sección de recetas
5. **Imágenes**: `LOTERIAFAMILY.jpg`, `LOYAL.jpg`, `PROMOS.png`, `miercolazo.png`

### 📂 Estructura Actual de tu Proyecto:

```
website/
├── .firebaserc              ← Configuración del proyecto
├── firebase.json            ← Configuración de hosting
├── index.html               ← Página principal
├── recetas/                 ← Carpeta de recetas
│   └── index.html
├── LOTERIAFAMILY.jpg        ← Imágenes
├── LOYAL.jpg
├── PROMOS.png
├── miercolazo.png
└── deploy.sh                ← Script de deployment
```

---

## 2. ✅ Contenido CORRECTO de `firebase.json`

Tu archivo `firebase.json` actual está **BIEN CONFIGURADO**. Aquí está el contenido que debes tener:

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

### 🔍 Explicación de la Configuración:

- **`"public": "."`** - Le dice a Firebase que publique desde el directorio actual (raíz del proyecto)
- **`"ignore"`** - Archivos que NO se subirán (archivos de desarrollo, configuración, etc.)
- **`"rewrites"`** - Todas las rutas se redirigen a `index.html` (comportamiento de SPA)
- **`"headers"`** - Configura caché de 7 días para imágenes y archivos estáticos

---

## 3. 📂 ¿Qué va dentro de la carpeta `public/`?

**IMPORTANTE:** Tu configuración actual usa `"public": "."` lo que significa que **NO NECESITAS** una carpeta `public/` separada.

Firebase publicará directamente desde el directorio raíz donde están todos tus archivos.

### Si quisieras usar una carpeta `public/` (OPCIONAL):

Si prefieres organizar tus archivos en una carpeta `public/`, harías esto:

1. Crear carpeta `public/`
2. Mover todos estos archivos dentro:
   - `index.html`
   - `recetas/`
   - Todas las imágenes (`.jpg`, `.png`)
3. Cambiar en `firebase.json`:
   ```json
   "public": "public"
   ```

**PERO NO ES NECESARIO** - tu configuración actual funciona perfectamente.

---

## 4. 🔥 Comandos EXACTOS para Publicar

### Paso A: Instalar Firebase CLI (Solo la primera vez)

```bash
npm install -g firebase-tools
```

**Verificar instalación:**
```bash
firebase --version
```

---

### Paso B: Inicializar Firebase Hosting (Si no está inicializado)

```bash
firebase init hosting
```

Cuando te pregunte:
1. **"What do you want to use as your public directory?"** → Escribe: `.` (punto)
2. **"Configure as a single-page app?"** → `y` (yes)
3. **"Set up automatic builds?"** → `n` (no)
4. **"File . already exists. Overwrite?"** → `n` (no)

---

### Paso C: Conectar con el proyecto `mexiquenseweb`

Tu archivo `.firebaserc` ya está configurado con el proyecto correcto:

```bash
firebase use mexiquenseweb-4931b
```

**Verificar que estás conectado al proyecto correcto:**
```bash
firebase projects:list
```

Debes ver `mexiquenseweb-4931b` en la lista.

---

### Paso D: Autenticarse con Firebase

```bash
firebase login
```

Esto abrirá tu navegador para que inicies sesión con tu cuenta de Google.

**Para verificar si ya estás autenticado:**
```bash
firebase login:list
```

---

### Paso E: Publicar el Sitio

**Opción 1: Usando el script automatizado (RECOMENDADO)**
```bash
./deploy.sh
```

**Opción 2: Comando directo**
```bash
firebase deploy --only hosting
```

**Opción 3: Deploy completo**
```bash
firebase deploy
```

---

## 5. ✅ Verificar que el Deploy fue Exitoso

### 1️⃣ Verifica en la Terminal

Después del deploy, deberías ver algo como:

```
✔  Deploy complete!

Project Console: https://console.firebase.google.com/project/mexiquenseweb-4931b/overview
Hosting URL: https://mexiquenseweb-4931b.web.app
```

### 2️⃣ Abre tu Sitio en el Navegador

Tu sitio estará disponible en **DOS URLs**:
- **Principal:** https://mexiquenseweb-4931b.web.app
- **Alternativa:** https://mexiquenseweb-4931b.firebaseapp.com

### 3️⃣ Verifica en Firebase Console

1. Abre: https://console.firebase.google.com/project/mexiquenseweb-4931b/hosting
2. Verás tu deployment con:
   - Fecha y hora
   - Estado: "Released"
   - Link del sitio activo

### 4️⃣ Checklist Post-Deployment

- [ ] El sitio carga sin mostrar "Site not found"
- [ ] La página principal se ve correctamente
- [ ] Las imágenes cargan (LOTERIAFAMILY.jpg, LOYAL.jpg, etc.)
- [ ] La navegación funciona (menú, botones)
- [ ] La sección `/recetas/` funciona
- [ ] No hay errores en la consola del navegador (F12)
- [ ] Firebase Analytics está activo (mensaje en consola: "Firebase initialized successfully")

---

## 6. 🆘 Solución de Problemas Comunes

### ❌ Error: "Site not found"

**Causa:** El sitio aún no se ha deployado o hubo un error.

**Solución:**
```bash
# Re-deploya el sitio
firebase deploy --only hosting

# Verifica el estado
firebase hosting:channel:list
```

---

### ❌ Error: "Not logged in"

**Solución:**
```bash
firebase logout
firebase login
```

---

### ❌ Error: "Permission denied"

**Causa:** Tu cuenta de Google no tiene permisos en el proyecto.

**Solución:**
1. Ve a https://console.firebase.google.com/project/mexiquenseweb-4931b/settings/iam
2. Verifica que tu email tenga rol de "Editor" o "Owner"

---

### ❌ Error: "No project active"

**Solución:**
```bash
firebase use mexiquenseweb-4931b
```

---

### ❌ Las imágenes no cargan

**Verifica:**
1. Que las imágenes están en el directorio raíz
2. Que los nombres coinciden exactamente (mayúsculas/minúsculas)
3. Ejecuta de nuevo:
```bash
firebase deploy --only hosting
```

---

## 7. 📊 Comandos Útiles Adicionales

### Ver el sitio localmente antes de deployar
```bash
firebase serve
```
Luego abre: http://localhost:5000

### Ver historial de deployments
```bash
firebase hosting:channel:list
```

### Abrir el sitio en el navegador
```bash
firebase open hosting:site
```

### Ver la configuración actual del proyecto
```bash
firebase projects:list
```

---

## 8. 🎯 Resumen: Proceso Completo en 5 Pasos

```bash
# 1. Instalar Firebase CLI (solo primera vez)
npm install -g firebase-tools

# 2. Autenticarse
firebase login

# 3. Verificar proyecto
firebase use mexiquenseweb-4931b

# 4. Deployar
firebase deploy --only hosting

# 5. Abrir sitio
# https://mexiquenseweb-4931b.web.app
```

---

## 9. 📱 Próximos Pasos (Opcional)

### Configurar Dominio Personalizado
1. Ve a Firebase Console → Hosting
2. Click en "Add custom domain"
3. Sigue las instrucciones para configurar DNS

### Configurar GitHub Actions para Deploy Automático
Cada vez que hagas push a GitHub, el sitio se actualizará automáticamente.

(Ver archivo FIREBASE_DEPLOYMENT.md para más detalles)

---

## ✅ ¡Listo!

Tu sitio debería estar ahora en línea y accesible en:
- https://mexiquenseweb-4931b.web.app
- https://mexiquenseweb-4931b.firebaseapp.com

Si tienes problemas, revisa la sección de "Solución de Problemas" o contacta al soporte de Firebase.

---

**Última actualización:** Enero 2026  
**Proyecto:** El Mexiquense Market  
**Firebase Project ID:** mexiquenseweb-4931b
