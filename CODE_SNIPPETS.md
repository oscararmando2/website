# 📝 Snippets de Código Implementados

## 🔥 Firebase Initialization

```javascript
// Import Firebase modules (modular v10.x)
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.14.1/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.14.1/firebase-analytics.js";
import { getDatabase, ref, onValue } from "https://www.gstatic.com/firebasejs/10.14.1/firebase-database.js";

// Firebase configuration for catalogomexiquense database
const firebaseConfig = {
  apiKey: "AIzaSyAdPcUhck0JzYonJAYfmfHKajDu96FqZsg",
  authDomain: "catalogomexiquense.firebaseapp.com",
  databaseURL: "https://catalogomexiquense-default-rtdb.firebaseio.com",
  projectId: "catalogomexiquense",
  storageBucket: "catalogomexiquense.firebasestorage.app",
  messagingSenderId: "105727682757",
  appId: "1:105727682757:web:2887f0de033b857786e8ac",
  measurementId: "G-PRXPTEW7WL"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const database = getDatabase(app);
```

## 🎯 Connect to especialesTienda Node

```javascript
// Reference to the especialesTienda node ONLY
const especialesRef = ref(database, 'especialesTienda');

// Listen for real-time updates
onValue(especialesRef, (snapshot) => {
  const data = snapshot.val();
  
  if (!data) {
    console.warn('No data found in especialesTienda node');
    return;
  }

  // Convert object to array
  const products = Object.values(data);
  console.log(`Loading ${products.length} products from especialesTienda`);
  
  // Render products
  products.forEach(product => {
    const card = createProductCard(product);
    productsContainer.appendChild(card);
  });
});
```

## 🎨 Product Card Creation

```javascript
function createProductCard(product) {
  const card = document.createElement('article');
  card.className = 'product-card';
  card.setAttribute('role', 'listitem');
  
  // Extract product fields with defaults
  const precioAntes = product.precioAntes || product.precio || '';
  const precioEspecial = product.precioEspecial || product.precioAntes || product.precio || '';
  const nombre = product.nombre || 'Producto';
  const imagen = product.imagen || product.url || 'https://via.placeholder.com/300x300?text=Sin+Imagen';
  const alt = product.alt || nombre;
  
  // Maintain exact same HTML structure as before
  card.innerHTML = `
    <span class="offer-badge" aria-live="polite"><span>${nombre}</span></span>
    <div class="product-media" aria-hidden="true">
      <img src="${imagen}" alt="${alt}" loading="lazy" 
           onerror="this.src='https://via.placeholder.com/300x300?text=Sin+Imagen'">
    </div>
    <div class="product-body">
      <h3 class="product-title">${nombre}</h3>
      <div class="price-stack" aria-label="Precio promocional de ${nombre}">
        <span class="price-mixed">
          <span><span class="price-label">Antes:</span> <span>$${precioAntes}</span></span>
          <span><span class="price-label price-label--now">Ahora:</span> <span class="price-current">$${precioEspecial}</span></span>
        </span>
      </div>
    </div>
  `;
  
  return card;
}
```

## 🛡️ Error Handling

```javascript
onValue(especialesRef, (snapshot) => {
  try {
    const data = snapshot.val();
    
    // Handle no data
    if (!data) {
      console.warn('No data found in especialesTienda node');
      productsContainer.innerHTML = '<p style="text-align: center; padding: 2rem; color: #666;">No hay productos disponibles en este momento.</p>';
      return;
    }

    // Clear and render products
    productsContainer.innerHTML = '';
    const products = Object.values(data);
    products.forEach(product => {
      const card = createProductCard(product);
      productsContainer.appendChild(card);
    });
    
  } catch (error) {
    // Handle processing errors
    console.error('Error processing Firebase data:', error);
    productsContainer.innerHTML = '<p style="text-align: center; padding: 2rem; color: #d32f2f;">Error al cargar los productos. Por favor, intenta más tarde.</p>';
  }
}, (error) => {
  // Handle connection errors
  console.error('Firebase read error:', error);
  productsContainer.innerHTML = '<p style="text-align: center; padding: 2rem; color: #d32f2f;">Error al conectar con la base de datos. Por favor, verifica tu conexión.</p>';
});
```

## 🚀 Complete Implementation

```javascript
function loadEspecialesTienda() {
  const productsContainer = document.querySelector('.product-carousel');
  
  if (!productsContainer) {
    console.error('Product carousel container not found');
    return;
  }

  // Reference to the especialesTienda node
  const especialesRef = ref(database, 'especialesTienda');
  
  // Listen for real-time updates
  onValue(especialesRef, (snapshot) => {
    try {
      const data = snapshot.val();
      
      if (!data) {
        console.warn('No data found in especialesTienda node');
        productsContainer.innerHTML = '<p style="text-align: center; padding: 2rem; color: #666;">No hay productos disponibles en este momento.</p>';
        return;
      }

      // Clear existing products
      productsContainer.innerHTML = '';
      
      // Convert object to array and render products
      const products = Object.values(data);
      console.log(`Loading ${products.length} products from especialesTienda`);
      
      products.forEach(product => {
        const card = createProductCard(product);
        productsContainer.appendChild(card);
      });
      
    } catch (error) {
      console.error('Error processing Firebase data:', error);
      productsContainer.innerHTML = '<p style="text-align: center; padding: 2rem; color: #d32f2f;">Error al cargar los productos. Por favor, intenta más tarde.</p>';
    }
  }, (error) => {
    console.error('Firebase read error:', error);
    if (productsContainer) {
      productsContainer.innerHTML = '<p style="text-align: center; padding: 2rem; color: #d32f2f;">Error al conectar con la base de datos. Por favor, verifica tu conexión.</p>';
    }
  });
}

// Initialize when DOM is ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', loadEspecialesTienda);
} else {
  loadEspecialesTienda();
}
```

## 📦 Firebase Data Structure

```json
{
  "especialesTienda": {
    "producto_001": {
      "nombre": "Chocolate Abuelita 19 Oz",
      "imagen": "https://example.com/chocolate.jpg",
      "precioAntes": "11.99",
      "precioEspecial": "9.99",
      "upc": "000000000001",
      "alt": "Chocolate Abuelita 19 Oz - chocolate mexicano"
    },
    "producto_002": {
      "nombre": "Maseca 2kg",
      "imagen": "https://example.com/maseca.jpg",
      "precioAntes": "6.99",
      "precioEspecial": "4.99",
      "upc": "000000000002",
      "alt": "Harina de maíz Maseca"
    }
  }
}
```

## 🌐 HTML Structure

### Before (Static)
```html
<div class="product-carousel" role="list">
  <article class="product-card" role="listitem">
    <span class="offer-badge"><span>Chocolate Abuelita 19 Oz</span></span>
    <div class="product-media">
      <img src="..." alt="...">
    </div>
    <div class="product-body">
      <h3 class="product-title">Chocolate Abuelita 19 Oz</h3>
      <div class="price-stack">
        <span>Antes: $11.99</span>
        <span>Ahora: $9.99</span>
      </div>
    </div>
  </article>
  <!-- ... 6 more hardcoded products ... -->
</div>
```

### After (Dynamic)
```html
<div class="product-carousel" role="list">
  <!-- Products loaded dynamically from Firebase -->
  <p>Cargando productos especiales...</p>
</div>

<script type="module">
  // Firebase automatically populates this container
  loadEspecialesTienda();
</script>
```

## 🔄 Real-time Updates Flow

```
1. User opens webpage
   ↓
2. Firebase connects to especialesTienda
   ↓
3. onValue() retrieves current data
   ↓
4. Products rendered in product-carousel
   ↓
5. [User edits product in Firebase Console]
   ↓
6. onValue() automatically fires
   ↓
7. Products re-rendered instantly
   ↓
8. No page reload needed! ✨
```

## 🎯 Usage Examples

### Add Product via Firebase Console
```javascript
// Navigate to: especialesTienda
// Click: "+" to add child
// Key: producto_003
// Value:
{
  "nombre": "Nuevo Producto",
  "imagen": "https://example.com/nuevo.jpg",
  "precioAntes": "15.99",
  "precioEspecial": "12.99",
  "upc": "000000000003"
}
// Save → Product appears on website instantly!
```

### Update Price via Firebase Console
```javascript
// Navigate to: especialesTienda/producto_001/precioEspecial
// Change value from "9.99" to "7.99"
// Save → Price updates on website instantly!
```

### Remove Product via Firebase Console
```javascript
// Navigate to: especialesTienda/producto_001
// Right-click → Remove
// Confirm → Product disappears from website instantly!
```

## 🔍 Debugging

### Check Firebase Connection
```javascript
// Open browser console (F12)
// You should see:
"Firebase initialized successfully"
"Loading X products from especialesTienda"
```

### Check Product Data
```javascript
// In browser console:
console.log(window.firebaseApp); // Should be defined
```

### Test with Test File
```html
<!-- Open: firebase-especialesTienda-test.html -->
<!-- Should show: "✓ Conexión exitosa! Se cargaron X productos" -->
```

---

**All code is in**: `/home/runner/work/website/website/index.html` (lines ~3040-3155)
