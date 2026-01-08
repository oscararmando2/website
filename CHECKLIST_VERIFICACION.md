# ✅ Checklist de Verificación Post-Deployment

## 🎯 Cómo verificar que tu sitio está funcionando correctamente

Usa esta lista después de hacer `firebase deploy` para confirmar que todo funciona.

---

## 1. ✅ Verificación Inmediata (En la Terminal)

Después de ejecutar `firebase deploy --only hosting`, debes ver:

```
✔  Deploy complete!

Project Console: https://console.firebase.google.com/project/mexiquenseweb-4931b/overview
Hosting URL: https://mexiquenseweb-4931b.web.app
```

**Si ves esto, ¡el deployment fue exitoso! ✅**

---

## 2. 🌐 Verificación en el Navegador

### Paso 1: Abre tu sitio

Visita una de estas URLs:
- https://mexiquenseweb-4931b.web.app
- https://mexiquenseweb-4931b.firebaseapp.com

### Paso 2: Verifica que NO diga "Site not found"

❌ **Si dice "Site not found":**
- Espera 1-2 minutos (el deploy puede tardar)
- Actualiza la página (Ctrl + F5)
- Ejecuta de nuevo: `firebase deploy --only hosting`

✅ **Si carga la página principal:**
¡Perfecto! Continúa con las siguientes verificaciones.

---

## 3. 📋 Checklist Visual del Sitio

Navega por tu sitio y verifica cada elemento:

### Página Principal (index.html)
- [ ] El título "El Mexiquense Market" aparece
- [ ] El video de fondo se reproduce
- [ ] El menú de navegación funciona
- [ ] Los botones responden al hacer clic

### Imágenes
- [ ] `PROMOS.png` - En la sección de promociones
- [ ] `miercolazo.png` - En la tarjeta de Miercolazo
- [ ] `LOTERIAFAMILY.jpg` - En la sección de lotería
- [ ] `LOYAL.jpg` - En la sección de programa de lealtad

### Secciones del Sitio
- [ ] **#inicio** - Hero con video
- [ ] **#promociones** - Carrusel de promociones
- [ ] **#productos** - Productos con precios
- [ ] **#recetas** - Sección de recetas
- [ ] **#contacto** - Formulario y mapas

### Navegación
- [ ] Click en "Recetas" → debe mostrar la sección
- [ ] Click en enlaces del menú → desplazamiento suave
- [ ] Menú hamburguesa funciona en móvil

### Carpeta Recetas
- [ ] Visita: https://mexiquenseweb-4931b.web.app/recetas/
- [ ] La página de recetas carga correctamente
- [ ] Las tarjetas de recetas se muestran

---

## 4. 🔧 Verificación Técnica (Consola del Navegador)

### Paso 1: Abrir Consola del Navegador
- **Chrome/Edge:** Presiona `F12`
- **Firefox:** Presiona `F12`
- **Safari:** Cmd + Option + C

### Paso 2: Buscar el Mensaje de Firebase
Debes ver en la consola:
```
Firebase initialized successfully
```

✅ **Si lo ves:** Firebase Analytics está funcionando correctamente.

❌ **Si NO lo ves:** Revisa que el script de Firebase esté en `index.html`.

### Paso 3: Verificar que NO haya errores

❌ **Errores comunes a buscar:**
- `404 (Not Found)` - Archivo no existe
- `Failed to load resource` - Imagen o archivo faltante
- `CORS error` - Problema de permisos

✅ **Si no hay errores en rojo:** Todo está bien.

---

## 5. 📱 Verificación en Dispositivos Móviles

### Responsive Design
- [ ] Abre el sitio en tu teléfono
- [ ] El diseño se adapta correctamente
- [ ] El menú hamburguesa funciona
- [ ] Las imágenes cargan
- [ ] Los botones son clickeables

### DevTools Mobile Emulation
1. En Chrome, presiona `F12`
2. Click en el ícono de dispositivo móvil (Toggle device toolbar)
3. Prueba diferentes tamaños de pantalla

---

## 6. 🔍 Verificación en Firebase Console

### Paso 1: Abre Firebase Console
https://console.firebase.google.com/project/mexiquenseweb-4931b/hosting

### Paso 2: Verifica el Deployment

Debes ver:
- ✅ **Status:** Released (con marca verde)
- ✅ **Deploy time:** Hace pocos minutos
- ✅ **Domain:** mexiquenseweb-4931b.web.app

### Paso 3: Revisa las Estadísticas

En la pestaña **Dashboard**:
- Requests - Número de solicitudes
- Bandwidth - Ancho de banda usado
- Storage - Espacio usado

---

## 7. 🧪 Tests de Rendimiento

### Test de Velocidad (Opcional)

Usa estas herramientas para verificar rendimiento:

1. **PageSpeed Insights**
   - https://pagespeed.web.dev/
   - Ingresa: https://mexiquenseweb-4931b.web.app

2. **GTmetrix**
   - https://gtmetrix.com/
   - Analiza tu sitio

3. **WebPageTest**
   - https://www.webpagetest.org/
   - Test detallado de carga

---

## 8. 🔐 Verificación de Seguridad

### SSL/HTTPS
- [ ] La URL comienza con `https://` (candado verde)
- [ ] No hay advertencias de certificado

### Firebase Security
- [ ] Las reglas de seguridad están configuradas
- [ ] No hay datos sensibles expuestos

---

## 9. 📊 Verificación de Analytics

### En Firebase Console → Analytics

Después de algunas visitas al sitio:
- [ ] Se registran eventos
- [ ] Aparecen usuarios activos
- [ ] Se rastrean páginas vistas

**Nota:** Los datos pueden tardar 24 horas en aparecer.

---

## 10. ✅ Checklist Final

Marca cuando completes cada verificación:

### Deployment
- [ ] Deploy completado sin errores
- [ ] URL funciona: https://mexiquenseweb-4931b.web.app
- [ ] URL alternativa funciona: https://mexiquenseweb-4931b.firebaseapp.com

### Contenido
- [ ] Página principal carga
- [ ] Todas las imágenes visibles
- [ ] Navegación funciona
- [ ] Sección recetas accesible

### Técnico
- [ ] Sin errores en consola del navegador
- [ ] Firebase Analytics activo
- [ ] SSL/HTTPS funcionando
- [ ] Responsive en móvil

### Firebase Console
- [ ] Deploy aparece como "Released"
- [ ] Dashboard muestra estadísticas
- [ ] No hay errores en logs

---

## 🆘 ¿Qué hacer si algo NO funciona?

### Si el sitio no carga ("Site not found")
```bash
# Re-deploya
firebase deploy --only hosting

# Verifica el proyecto
firebase use mexiquenseweb-4931b

# Confirma que estás logueado
firebase login:list
```

### Si las imágenes no cargan
1. Verifica que las imágenes están en el directorio raíz
2. Confirma los nombres (mayúsculas/minúsculas importan)
3. Re-deploya: `firebase deploy --only hosting`

### Si hay errores en consola
1. Identifica el error específico
2. Verifica que todos los archivos estén presentes
3. Revisa la configuración de `firebase.json`

### Si Firebase Analytics no funciona
1. Verifica que el script de Firebase esté en `index.html`
2. Espera 24 horas para que aparezcan datos
3. Revisa Firebase Console → Analytics

---

## 📞 Soporte Adicional

Si después de estas verificaciones algo no funciona:

1. **Firebase Support:**
   - https://firebase.google.com/support

2. **Stack Overflow:**
   - Tag: `firebase-hosting`
   - https://stackoverflow.com/questions/tagged/firebase-hosting

3. **Firebase Community:**
   - https://firebase.google.com/community

---

## 🎉 ¡Sitio Verificado y Funcionando!

Si marcaste todas las casillas: **¡Felicidades! Tu sitio está correctamente deployado.**

**URLs de tu sitio:**
- https://mexiquenseweb-4931b.web.app
- https://mexiquenseweb-4931b.firebaseapp.com

**Firebase Console:**
- https://console.firebase.google.com/project/mexiquenseweb-4931b

---

**💡 Tip:** Guarda este checklist para futuros deployments.
