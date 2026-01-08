# Quick Start - Firebase Deployment

## 🚀 3 Simple Steps to Deploy

### Step 1: Install Firebase Tools
```bash
npm install -g firebase-tools
```

### Step 2: Login to Firebase
```bash
firebase login
```
This will open a browser window for authentication.

### Step 3: Deploy
```bash
firebase deploy
```
Or use the automated script:
```bash
./deploy.sh
```

## ✅ That's it!

Your site will be live at:
- https://mexiquenseweb-4931b.web.app
- https://mexiquenseweb-4931b.firebaseapp.com

## 📝 Using npm scripts

```bash
# Local preview with Firebase emulator
npm run serve

# Deploy to production
npm run deploy

# Deploy only hosting
npm run deploy:hosting

# Local server (alternative)
npm start
```

## 🔍 Verify Deployment

After deploying, check:
1. Visit your live URL
2. Open browser console - should see "Firebase initialized successfully"
3. Check Firebase Console: https://console.firebase.google.com/project/mexiquenseweb-4931b/hosting

## 📚 Need More Help?

See [FIREBASE_DEPLOYMENT.md](FIREBASE_DEPLOYMENT.md) for complete documentation.

## 🆘 Troubleshooting

**Not logged in?**
```bash
firebase logout
firebase login
```

**Wrong project?**
```bash
firebase use mexiquenseweb-4931b
```

**Check your projects:**
```bash
firebase projects:list
```
