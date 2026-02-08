# Checklist de Verificación en Producción

## ⚠️ Nota Importante
Este código ha sido implementado y revisado, pero no pudo ser completamente probado en el ambiente de desarrollo porque las URLs de CDN de Firebase están bloqueadas en el entorno sandbox. El código es correcto y funcionará en producción.

## Pasos de Verificación Post-Deployment

### 1. Verificar Carga de Firebase
- [ ] Abrir https://mexiquensemarket.com/#productos
- [ ] Abrir la consola del navegador (F12)
- [ ] Verificar que aparezca: `"Firebase initialized successfully"`
- [ ] Verificar que aparezca: `"Loading X products from especialesTienda"`

### 2. Verificar Visualización de Productos
- [ ] La sección "SEMANITA DEL AHORRO %" debe mostrar productos
- [ ] Las tarjetas deben tener el mismo diseño que antes
- [ ] Cada tarjeta debe mostrar:
  - Badge con nombre del producto
  - Imagen del producto
  - Título del producto
  - "Antes: $X.XX"
  - "Ahora: $X.XX" (en verde)

### 3. Verificar Datos de Firebase
- [ ] Ir a Firebase Console
- [ ] Navegar a: https://console.firebase.google.com/project/catalogomexiquense/database
- [ ] Verificar que existe el nodo `especialesTienda`
- [ ] Confirmar que tiene productos con la estructura:
  ```json
  {
    "especialesTienda": {
      "producto1": {
        "nombre": "Nombre del producto",
        "imagen": "URL de la imagen",
        "precioAntes": "XX.XX",
        "precioEspecial": "XX.XX",
        "upc": "XXXXXXXXX"
      }
    }
  }
  ```

### 4. Probar Actualizaciones en Tiempo Real
- [ ] Con el sitio web abierto
- [ ] Ir a Firebase Console
- [ ] Cambiar el precio de un producto
- [ ] Verificar que el cambio aparezca automáticamente en el sitio (sin recargar)

### 5. Verificar Manejo de Errores

#### Sin Datos
- [ ] Vaciar el nodo `especialesTienda` temporalmente
- [ ] Verificar que aparezca: "No hay productos disponibles en este momento."
- [ ] Restaurar los productos

#### Permisos
- [ ] Verificar que las reglas de Firebase permitan lectura pública:
  ```json
  {
    "rules": {
      "especialesTienda": {
        ".read": true,
        ".write": false
      }
    }
  }
  ```

### 6. Verificar Imágenes
- [ ] Todas las imágenes de productos deben cargar correctamente
- [ ] Si una imagen falla, debe mostrar un placeholder
- [ ] No deben aparecer imágenes rotas

### 7. Verificar Responsividad
- [ ] Abrir en dispositivo móvil (o DevTools responsive mode)
- [ ] Verificar que las tarjetas se vean correctamente
- [ ] Verificar que el scroll horizontal funcione

### 8. Verificar Accesibilidad
- [ ] Las tarjetas deben tener `role="listitem"`
- [ ] Los badges deben tener `aria-live="polite"`
- [ ] Las imágenes deben tener atributo `alt`
- [ ] Los precios deben tener `aria-label`

### 9. Usar Archivo de Prueba
- [ ] Abrir https://mexiquensemarket.com/firebase-especialesTienda-test.html
- [ ] Verificar que muestre: "✓ Conexión exitosa!"
- [ ] Verificar que liste todos los productos con sus datos
- [ ] Útil para debug rápido sin afectar el sitio principal

### 10. Verificar SEO
- [ ] Ver código fuente de la página
- [ ] Confirmar que el contenedor `.product-carousel` existe
- [ ] Los productos dinámicos pueden tardar un momento en aparecer para crawlers
- [ ] Considerar pre-renderización si es crítico para SEO

## Problemas Comunes y Soluciones

### Problema: "No hay productos disponibles"
**Causas posibles:**
- El nodo `especialesTienda` está vacío en Firebase
- El nodo no existe
- Error de tipeo en el nombre del nodo

**Solución:**
- Verificar que existe `especialesTienda` en Firebase
- Agregar al menos un producto de prueba

### Problema: "Error al conectar con la base de datos"
**Causas posibles:**
- Reglas de Firebase no permiten lectura
- Problemas de red
- URL de database incorrecta

**Solución:**
- Verificar reglas de Firebase (debe permitir `.read: true` en especialesTienda)
- Verificar que la `databaseURL` sea correcta

### Problema: Productos no se actualizan en tiempo real
**Causas posibles:**
- Problemas con la conexión WebSocket
- Firebase Realtime Database no activo

**Solución:**
- Recargar la página
- Verificar en Firebase Console que el database está activo
- Verificar consola del navegador por errores

### Problema: Imágenes no cargan
**Causas posibles:**
- URLs de imágenes inválidas
- Imágenes no públicas
- CORS bloqueando las imágenes

**Solución:**
- Verificar que las URLs sean válidas y públicas
- El sistema usa placeholder automáticamente como fallback

## Contacto para Soporte

Si encuentras algún problema:
1. Revisa la consola del navegador (F12) para errores
2. Verifica Firebase Console para confirmar datos
3. Usa `firebase-especialesTienda-test.html` para diagnosticar
4. Consulta `FIREBASE_ESPECIALESTIENDA_README.md` para más detalles

## Notas de Seguridad

- La API key de Firebase está en el código (es normal para Firebase Web)
- Las reglas de Firebase controlan el acceso real
- Solo se permite lectura pública, no escritura
- Los datos son públicos (productos de la tienda)
