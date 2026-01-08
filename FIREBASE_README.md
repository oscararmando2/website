# Firebase Integration - El Mexiquense Market

This document describes the Firebase integration implemented for the El Mexiquense Market website.

## Overview

Firebase has been integrated into the website to enable:
- **Analytics**: Track user interactions and page views
- **Future capabilities**: Authentication, Database, Storage, and other Firebase services can be easily added

## Implementation

### Files Added/Modified

1. **index.html** - Main website file with Firebase SDK integration
2. **firebase-config.js** - Firebase configuration module (for npm-based builds)
3. **firebase-test.html** - Test page to verify Firebase integration
4. **package.json** - Node.js project configuration
5. **.gitignore** - Excludes node_modules and other unnecessary files

### Firebase Configuration

The Firebase project is configured with the following details:

```javascript
{
  apiKey: "AIzaSyB_5GFz2nM55vesrFvFE5QHSXaGxfuuZ9A",
  authDomain: "mexiquenseweb-4931b.firebaseapp.com",
  projectId: "mexiquenseweb-4931b",
  storageBucket: "mexiquenseweb-4931b.firebasestorage.app",
  messagingSenderId: "416413628432",
  appId: "1:416413628432:web:48c17c2be2238fd17e3295",
  measurementId: "G-VWBPN4DQJE"
}
```

## How It Works

### CDN-Based Implementation (index.html)

The website uses Firebase's CDN for easy integration without a build process:

```html
<script type="module">
  import { initializeApp } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-analytics.js";
  
  const firebaseConfig = { /* ... */ };
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
  
  window.firebaseApp = app;
  window.firebaseAnalytics = analytics;
</script>
```

### NPM-Based Implementation (firebase-config.js)

For projects using npm/webpack/vite, the `firebase-config.js` module can be imported:

```javascript
import { app, analytics } from './firebase-config.js';
```

## Testing

To verify Firebase is working correctly:

1. Open `firebase-test.html` in a web browser
2. Check the browser console for Firebase initialization messages
3. Look for "Firebase initialized successfully" message

## Usage

### Analytics

Firebase Analytics is automatically initialized and tracking page views. To track custom events:

```javascript
import { logEvent } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-analytics.js";

// Track custom event
logEvent(window.firebaseAnalytics, 'button_click', {
  button_name: 'promociones'
});
```

### Adding More Firebase Services

To add additional Firebase services (Auth, Firestore, Storage, etc.), simply import them:

```javascript
import { getAuth } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-auth.js";
import { getFirestore } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-firestore.js";

const auth = getAuth(window.firebaseApp);
const db = getFirestore(window.firebaseApp);
```

## Development

### Install Dependencies

```bash
npm install
```

This installs the Firebase SDK package for development purposes.

### Local Testing

1. Start a local web server:
   ```bash
   python3 -m http.server 8080
   ```

2. Open `http://localhost:8080` in your browser

3. Check the browser console for Firebase initialization messages

## Security Notes

- The API key in the configuration is safe to expose in client-side code
- Firebase security rules should be properly configured in the Firebase Console
- For production use, ensure Firebase Security Rules are set up correctly

## Next Steps

Consider implementing:
- User authentication with Firebase Auth
- Store product data in Firestore
- Upload product images to Firebase Storage
- Send push notifications with Firebase Cloud Messaging
- Track user engagement with Firebase Analytics events

## Resources

- [Firebase Documentation](https://firebase.google.com/docs)
- [Firebase JavaScript SDK](https://firebase.google.com/docs/web/setup)
- [Firebase Analytics](https://firebase.google.com/docs/analytics)
