# Guía de Prueba del Formulario de Contacto

## ⚠️ IMPORTANTE: Verificación Inicial Requerida

Antes de que el formulario funcione, **DEBE** completarse la verificación por correo electrónico:

### Pasos para la Verificación Inicial:

1. **Envía un mensaje de prueba** desde el formulario web
2. **Revisa el buzón** de `mexi.quense1086@gmail.com`
3. **Abre el correo** de FormSubmit con asunto similar a "Activate your FormSubmit Email"
4. **Haz clic** en el enlace de activación del correo
5. **Confirma** que ves un mensaje de éxito en FormSubmit

✅ **Después de completar estos pasos**, todos los mensajes futuros llegarán automáticamente.

## Cómo Probar el Formulario

### Opción 1: Prueba Local

1. Inicia un servidor local:
   ```bash
   npm run start
   ```
   O:
   ```bash
   python3 -m http.server 8080
   ```

2. Abre tu navegador en: `http://localhost:8080`

3. Navega a la sección de contacto (#contacto)

4. Completa el formulario:
   - **Nombre completo**: Tu nombre de prueba
   - **Correo electrónico**: Tu correo personal
   - **Mensaje**: "Prueba del formulario de contacto"

5. Haz clic en "Enviar mensaje"

6. Verifica que aparezca el mensaje: "¡Gracias! Te responderemos muy pronto."

### Opción 2: Prueba en Producción

1. Visita el sitio web desplegado

2. Navega a la sección de contacto

3. Completa y envía el formulario de prueba

### Verificar que Llegó el Correo

1. Revisa la bandeja de entrada de `mexi.quense1086@gmail.com`

2. Busca un correo con asunto: "Nuevo mensaje desde El Mexiquense Market"

3. Verifica que el correo contenga:
   - Nombre del remitente
   - Correo electrónico del remitente
   - Mensaje enviado
   - Formato de tabla legible

## Qué Esperar en el Correo

El correo llegará con este formato:

```
De: noreply@formsubmit.co
Para: mexi.quense1086@gmail.com
Asunto: Nuevo mensaje desde El Mexiquense Market

┌────────────────┬───────────────────────────┐
│ name           │ [Nombre del remitente]    │
│ email          │ [Correo del remitente]    │
│ message        │ [Mensaje del remitente]   │
└────────────────┴───────────────────────────┘
```

## Solución de Problemas

### El formulario se envía pero no llega el correo

1. ✅ **Verifica la verificación inicial**: Si es la primera vez que se usa el formulario, revisa el correo de verificación
2. ✅ **Revisa spam**: Busca en la carpeta de correo no deseado
3. ✅ **Espera unos minutos**: Los correos pueden tardar 1-2 minutos en llegar
4. ✅ **Verifica el correo en el código**: Abre `index.html` y busca `formsubmit.co/` para confirmar el correo

### Aparece un error al enviar

1. ✅ **Completa todos los campos**: Nombre, correo y mensaje son obligatorios
2. ✅ **Usa un correo válido**: El campo de correo debe tener formato válido (ejemplo@dominio.com)
3. ✅ **Revisa la consola del navegador**: Presiona F12 y busca errores en la pestaña "Console"

### Quiero cambiar el correo de destino

1. Abre `index.html`
2. Busca: `action="https://formsubmit.co/mexi.quense1086@gmail.com"`
3. Cambia la dirección de correo
4. Guarda y despliega los cambios
5. **Repite el proceso de verificación** con el nuevo correo

## Configuración Adicional (Opcional)

### Activar CAPTCHA (Anti-Spam)

Si recibes spam, edita `index.html`:

```html
<!-- Cambiar de: -->
<input type="hidden" name="_captcha" value="false">

<!-- A: -->
<input type="hidden" name="_captcha" value="true">
```

### Personalizar el Asunto del Correo

Edita la línea en `index.html`:

```html
<input type="hidden" name="_subject" value="Nuevo mensaje desde El Mexiquense Market">
```

Cambia el texto entre comillas al asunto deseado.

### Añadir Página de Agradecimiento

Agrega esta línea después del campo `_subject`:

```html
<input type="hidden" name="_next" value="https://tu-sitio.com/gracias.html">
```

Esto redirigirá al usuario a una página de agradecimiento después de enviar el formulario.

## Referencias

- FormSubmit Documentation: https://formsubmit.co/
- Repositorio: https://github.com/oscararmando2/website
- Documentación Completa: Ver archivo `CONFIGURACION_FORMULARIO.md`

