# Firebase Hosting Deployment Guide

This guide explains how to deploy the El Mexiquense Market website to Firebase Hosting.

## Prerequisites

✅ Firebase CLI installed globally: `npm install -g firebase-tools`
✅ Firebase project created: `mexiquenseweb-4931b`
✅ Configuration files created: `firebase.json` and `.firebaserc`

## Deployment Steps

### 1. Install Firebase CLI (if not already installed)

```bash
npm install -g firebase-tools
```

### 2. Authenticate with Firebase

```bash
firebase login
```

This will open a browser window for you to sign in with your Google account that has access to the Firebase project.

### 3. Verify Project Configuration

```bash
firebase projects:list
```

Make sure `mexiquenseweb-4931b` is listed and accessible.

### 4. Deploy to Firebase Hosting

From the project root directory:

```bash
firebase deploy
```

Or to deploy only hosting:

```bash
firebase deploy --only hosting
```

### 5. View Your Live Site

After deployment completes, your site will be live at:
- **Primary URL**: https://mexiquenseweb-4931b.web.app
- **Alternative URL**: https://mexiquenseweb-4931b.firebaseapp.com

## Configuration Details

### firebase.json

The hosting configuration specifies:
- **Public directory**: `.` (current directory, serves all files)
- **Ignore files**: Development files, configs, and test files are excluded
- **Rewrites**: All routes redirect to `index.html` (SPA behavior)
- **Cache headers**: Images and static assets cached for 7 days

### .firebaserc

Contains the project alias:
```json
{
  "projects": {
    "default": "mexiquenseweb-4931b"
  }
}
```

## Deployment Commands Reference

### Deploy everything
```bash
firebase deploy
```

### Deploy only hosting
```bash
firebase deploy --only hosting
```

### Preview before deploying
```bash
firebase serve
```
Then visit http://localhost:5000

### View deployment history
```bash
firebase hosting:channel:list
```

### Rollback to previous version
```bash
firebase hosting:clone SOURCE:CHANNEL_ID TARGET:live
```

## Custom Domain Setup (Optional)

1. Go to Firebase Console → Hosting
2. Click "Add custom domain"
3. Follow the DNS configuration steps
4. Example: `www.elmexiquensemarket.com`

## Environment Variables (Future)

For sensitive data, use Firebase environment config:

```bash
firebase functions:config:set someservice.key="THE API KEY"
```

## Continuous Deployment (CI/CD)

For automated deployments from GitHub Actions:

1. Generate a CI token:
```bash
firebase login:ci
```

2. Add the token to GitHub Secrets as `FIREBASE_TOKEN`

3. Use GitHub Actions workflow (example):

```yaml
name: Deploy to Firebase Hosting
on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: '${{ secrets.GITHUB_TOKEN }}'
          firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
          channelId: live
          projectId: mexiquenseweb-4931b
```

## Troubleshooting

### Authentication Issues
```bash
firebase logout
firebase login
```

### Permission Errors
Ensure your Google account has the "Editor" or "Owner" role in the Firebase project.

### Deployment Fails
Check:
- All required files are present
- No syntax errors in `firebase.json`
- Correct project ID in `.firebaserc`

### View deployment logs
```bash
firebase hosting:channel:list
```

## Testing Before Deployment

### Local Testing
```bash
firebase serve
```

Or use Python's simple server:
```bash
python3 -m http.server 8080
```

## Post-Deployment

After successful deployment:
1. ✅ Visit your live site URL
2. ✅ Test all pages and functionality
3. ✅ Check browser console for any errors
4. ✅ Verify Firebase Analytics is tracking
5. ✅ Test on mobile devices

## Firebase Hosting Features

Your site now benefits from:
- 🚀 **Global CDN**: Fast loading worldwide
- 🔒 **Free SSL**: Automatic HTTPS
- 📊 **Analytics**: Integrated with Firebase Analytics
- ⚡ **Performance**: Optimized delivery
- 🔄 **Easy rollbacks**: Version history maintained
- 💰 **Free tier**: Generous free usage limits

## Support

- [Firebase Hosting Documentation](https://firebase.google.com/docs/hosting)
- [Firebase Console](https://console.firebase.google.com/project/mexiquenseweb-4931b)
- [Firebase CLI Reference](https://firebase.google.com/docs/cli)

## Quick Reference

| Command | Description |
|---------|-------------|
| `firebase login` | Authenticate with Firebase |
| `firebase init` | Initialize Firebase project |
| `firebase serve` | Test locally (port 5000) |
| `firebase deploy` | Deploy to production |
| `firebase deploy --only hosting` | Deploy only hosting |
| `firebase open hosting:site` | Open live site in browser |
| `firebase hosting:channel:list` | List deployment channels |

---

**Note**: The first deployment may take 1-2 minutes. Subsequent deployments are typically faster.
