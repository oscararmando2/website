# ⚡ Comandos Rápidos - Firebase Deployment

## 🚀 Deployment en 3 Pasos

```bash
# 1. Login (solo primera vez)
firebase login

# 2. Conectar al proyecto
firebase use mexiquenseweb-4931b

# 3. Publicar
firebase deploy --only hosting
```

## 📋 URLs de tu Sitio

- **Principal:** https://mexiquenseweb-4931b.web.app
- **Alternativa:** https://mexiquenseweb-4931b.firebaseapp.com
- **Console:** https://console.firebase.google.com/project/mexiquenseweb-4931b/hosting

## 🔧 Comandos Útiles

```bash
# Ver preview local (antes de publicar)
firebase serve
# → http://localhost:5000

# Ver lista de proyectos
firebase projects:list

# Ver historial de deployments
firebase hosting:channel:list

# Abrir sitio en navegador
firebase open hosting:site

# Logout y re-login
firebase logout
firebase login

# Re-deployar
firebase deploy --only hosting
```

## ✅ Verificación Post-Deploy

1. **Abre:** https://mexiquenseweb-4931b.web.app
2. **Verifica:**
   - ✓ Sitio carga sin "Site not found"
   - ✓ Imágenes aparecen correctamente
   - ✓ Navegación funciona
   - ✓ Sección recetas accesible

## 🆘 Solución Rápida de Problemas

| Problema | Solución |
|----------|----------|
| "Site not found" | `firebase deploy --only hosting` |
| "Not logged in" | `firebase login` |
| "No project active" | `firebase use mexiquenseweb-4931b` |
| Imágenes no cargan | Verifica nombres y re-deploya |

## 📱 Script Automatizado

```bash
# Usa el script incluido
./deploy.sh
```

El script hace todo automáticamente:
- ✓ Verifica Firebase CLI
- ✓ Chequea archivos necesarios
- ✓ Verifica autenticación
- ✓ Deploya el sitio

---

**💡 Tip:** Guarda este archivo para referencia rápida.

Para la guía completa ver: [GUIA_COMPLETA_DEPLOYMENT.md](GUIA_COMPLETA_DEPLOYMENT.md)
