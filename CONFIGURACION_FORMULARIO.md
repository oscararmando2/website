# Configuración del Formulario de Contacto

## Servicio Utilizado

El formulario de contacto utiliza **FormSubmit.co**, un servicio gratuito que permite recibir mensajes del formulario web directamente por correo electrónico sin necesidad de configurar un servidor backend.

## Correo de Destino

Todos los mensajes del formulario se envían a: **mexi.quense1086@gmail.com**

## Configuración Inicial (IMPORTANTE)

### Primer Uso - Verificación Requerida

La primera vez que alguien envíe un mensaje a través del formulario:

1. **FormSubmit enviará un correo de verificación** a `mexi.quense1086@gmail.com`
2. **Debes abrir ese correo** y hacer clic en el enlace de verificación
3. **Después de verificar**, todos los mensajes futuros llegarán automáticamente

⚠️ **IMPORTANTE**: Hasta que se complete la verificación, los mensajes del formulario NO llegarán al correo electrónico.

## Características del Formulario

El formulario incluye:
- **Nombre completo** del remitente
- **Correo electrónico** del remitente (para poder responder)
- **Mensaje** del remitente
- **Asunto automático**: "Nuevo mensaje desde El Mexiquense Market"
- **Sin CAPTCHA**: Para facilitar el envío (se puede activar si hay spam)
- **Formato de tabla**: Los correos llegan en formato de tabla para fácil lectura

## Campos Ocultos Configurados

```html
<input type="hidden" name="_subject" value="Nuevo mensaje desde El Mexiquense Market">
<input type="hidden" name="_captcha" value="false">
<input type="hidden" name="_template" value="table">
```

### Explicación de campos:
- `_subject`: Define el asunto del correo
- `_captcha`: Desactiva el CAPTCHA (cambiar a "true" para activar protección anti-spam)
- `_template`: Define el formato del correo (table = tabla, box = caja)

## Modificar el Correo de Destino

Para cambiar el correo donde llegan los mensajes:

1. Abre el archivo `index.html`
2. Busca la línea que contiene: `<form id="contactForm" action="https://formsubmit.co/..."`
3. Cambia el correo en la URL a la nueva dirección deseada
4. Guarda el archivo
5. Realiza el proceso de verificación con el nuevo correo

## Activar Protección Anti-Spam

Si comienzas a recibir spam, puedes activar el CAPTCHA:

1. Abre `index.html`
2. Busca: `<input type="hidden" name="_captcha" value="false">`
3. Cámbialo a: `<input type="hidden" name="_captcha" value="true">`
4. Guarda los cambios

## Soporte

- Documentación de FormSubmit: https://formsubmit.co/
- Email del servicio no requiere cuenta ni registro
- Servicio completamente gratuito

## Solución de Problemas

### No llegan los correos
- ✅ Verifica que hayas completado la verificación del correo
- ✅ Revisa la carpeta de spam/correo no deseado
- ✅ Confirma que el correo en `index.html` sea correcto

### Error al enviar el formulario
- ✅ Verifica que todos los campos requeridos estén completos
- ✅ Revisa la conexión a Internet
- ✅ Comprueba que el correo esté correctamente configurado en el código

