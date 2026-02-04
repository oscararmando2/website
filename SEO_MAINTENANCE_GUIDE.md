# 🚀 Guía Rápida de Mantenimiento SEO - El Mexiquense Market

## 📋 Checklist Semanal (5 minutos)

### Google Search Console
1. Revisa impresiones y clicks
2. Verifica que no haya errores de cobertura
3. Checa posiciones de keywords principales

### Google Business Profile
1. Responde reseñas nuevas
2. Publica una foto o actualización
3. Verifica horarios y teléfono

---

## 📊 Checklist Mensual (30 minutos)

### Análisis de Performance
- [ ] Revisar tráfico orgánico en Google Analytics
- [ ] Comparar posiciones de keywords vs mes anterior
- [ ] Verificar CTR promedio (objetivo: >3%)
- [ ] Revisar Core Web Vitals en Search Console

### Contenido Nuevo
- [ ] Publicar 1-2 recetas nuevas con Schema Recipe
- [ ] Actualizar ofertas/promociones
- [ ] Agregar fotos nuevas de productos

### Links y Menciones
- [ ] Buscar menciones de la marca en Google
- [ ] Verificar backlinks en Search Console
- [ ] Registrar negocio en 1 directorio local nuevo

---

## ✅ Cómo Agregar Una Nueva Receta (SEO Optimizado)

Cada vez que agregues una receta nueva, incluye este Schema.org en el HTML:

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Recipe",
  "name": "Tacos de Carne Asada",
  "image": "https://elmexiquensemarket.com/images/tacos-carne-asada.jpg",
  "description": "Tacos auténticos de carne asada al estilo mexicano con ingredientes frescos de El Mexiquense Market.",
  "keywords": "tacos, carne asada, receta mexicana, El Mexiquense",
  "author": {
    "@type": "Organization",
    "name": "El Mexiquense Market"
  },
  "prepTime": "PT15M",
  "cookTime": "PT20M",
  "totalTime": "PT35M",
  "recipeYield": "4 porciones",
  "recipeCategory": "Plato Principal",
  "recipeCuisine": "Mexicana",
  "recipeIngredient": [
    "1 lb carne para asar",
    "8 tortillas de maíz",
    "1 cebolla blanca",
    "Cilantro fresco",
    "Limones"
  ],
  "recipeInstructions": [
    {
      "@type": "HowToStep",
      "text": "Marinar la carne por 30 minutos."
    },
    {
      "@type": "HowToStep",
      "text": "Asar la carne a fuego alto por 6-8 minutos por lado."
    }
  ],
  "nutrition": {
    "@type": "NutritionInformation",
    "calories": "450 calorías"
  }
}
</script>
```

**Beneficio**: Aparecerá en Google con foto, tiempo de preparación, y rating.

---

## 🎯 Keywords a Monitorear (Top 10)

Revisa estas keywords mensualmente en Search Console → Performance:

1. **"supermercado latino overland mo"** → Objetivo: Posición 1-3
2. **"supermercado mexicano st charles"** → Objetivo: Posición 1-3
3. **"tienda latina cerca de mi missouri"** → Objetivo: Top 10
4. **"el mexiquense market"** → Objetivo: Posición 1
5. **"productos mexicanos overland"** → Objetivo: Top 5
6. **"tortillas frescas missouri"** → Objetivo: Top 10
7. **"market mexicano st louis"** → Objetivo: Top 10
8. **"supermercado latino cerca de mi"** → Objetivo: Top 20
9. **"envio de dinero mexico missouri"** → Objetivo: Top 15
10. **"cambio de cheques overland mo"** → Objetivo: Top 10

---

## 🔄 Cómo Actualizar Promociones (mantener SEO)

Cuando cambies las promociones del carrusel:

### ✅ HACER:
1. Mantener estructura HTML existente
2. Actualizar `alt` tags con keywords relevantes
3. Usar imágenes optimizadas (< 500KB, WebP si es posible)
4. Mantener `loading="lazy"` en todas las imágenes

### ❌ NO HACER:
1. No eliminar comentarios SEO en el código
2. No cambiar el H1 principal sin consultar
3. No remover structured data (JSON-LD)

### Ejemplo de alt tag optimizado para promo:
```html
<img src="nueva-promo.png" 
     alt="Promoción descuentos fin de semana productos mexicanos El Mexiquense Market Overland Missouri"
     loading="lazy">
```

---

## 🛠️ Herramientas Recomendadas (Gratis)

### Para SEO
1. **Google Search Console**: https://search.google.com/search-console
   - Monitoreo de posiciones y clicks
   - Detección de errores de indexación

2. **Google Analytics 4**: https://analytics.google.com
   - Tráfico orgánico
   - Conversiones

3. **Google Business Profile**: https://business.google.com
   - Gestión de reseñas
   - Estadísticas de Maps

4. **Rich Results Test**: https://search.google.com/test/rich-results
   - Verificar structured data

5. **PageSpeed Insights**: https://pagespeed.web.dev
   - Velocidad y Core Web Vitals

### Para Keywords Research
1. **Google Trends**: Tendencias de búsqueda
2. **AnswerThePublic**: Ideas de contenido
3. **Ubersuggest**: Volumen de búsqueda (gratis limitado)

---

## 📸 Checklist de Imágenes Optimizadas

Cada imagen nueva debe cumplir:

- [ ] Tamaño: < 500KB (idealmente < 200KB)
- [ ] Formato: WebP o JPEG optimizado
- [ ] Dimensiones: Apropiadas (no subir 4000px si solo se muestra 400px)
- [ ] Nombre de archivo: descriptivo (ej: `promo-miercolazo-feb-2026.jpg`)
- [ ] Alt tag: Descriptivo con keywords (80-125 caracteres)
- [ ] Atributo: `loading="lazy"` (excepto hero image)

**Herramienta para comprimir**: https://squoosh.app

---

## 🚨 Alertas a Monitorear

### En Search Console (revisar semanalmente)
- ⚠️ "Errores de cobertura" > 0 → Investigar inmediatamente
- ⚠️ "Problemas de usabilidad móvil" → Corregir antes de 7 días
- ⚠️ "Acciones manuales" → Acción inmediata requerida
- ✅ "Mejoras" en Structured Data → Revisar si hay advertencias

### En Google Business Profile
- ⚠️ Reseñas negativas sin respuesta → Responder en 24 horas
- ⚠️ Información duplicada → Corregir de inmediato
- ⚠️ Cambios no autorizados → Reportar a Google

---

## 🎓 Reglas de Oro SEO para Este Sitio

### 1. Consistencia NAP (Name, Address, Phone)
**SIEMPRE usar exactamente**:
- Nombre: `El Mexiquense Market`
- Teléfono: `+1-314-428-4919`
- Direcciones:
  - `9525 Lackland Rd, Overland, MO 63114`
  - `1009 S Duchesne Dr, St Charles, MO 63301`

### 2. No Tocar Sin Revisar
- JSON-LD structured data
- Meta tags en `<head>`
- H1 principal
- Alt tags optimizados
- Canonical URLs

### 3. Agregar Contenido = Agregar Keywords
Cada contenido nuevo (blog, receta, producto) debe incluir:
- Keywords locales (Overland, St Charles, Missouri)
- Keywords de producto (tortillas, carnes, frutas)
- Intención de búsqueda (cerca de mí, comprar, recetas)

### 4. Mobile First
- Probar todos los cambios en móvil primero
- Velocidad < 3 segundos en 4G
- Botones táctiles > 48px x 48px

---

## 📞 Soporte

**Dudas sobre SEO**:
- Email: mexi.quense1086@gmail.com
- WhatsApp: https://whatsapp.com/channel/0029VbBpK3I2f3EFCBkqI42g

**Recursos Adicionales**:
- Ver `SEO_OPTIMIZATION_REPORT.md` para detalles completos
- Documentación técnica en `EXPLICACION_ARCHIVOS.md`

---

**Última actualización**: 4 de febrero de 2026  
**Versión**: 1.0
