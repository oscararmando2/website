#!/bin/bash
# Firebase Deployment Script for El Mexiquense Market

set -e  # Exit on error

echo "🔥 Firebase Deployment Script"
echo "================================"
echo ""

# Check if Firebase CLI is installed
if ! command -v firebase &> /dev/null; then
    echo "❌ Firebase CLI is not installed."
    echo "Installing Firebase CLI..."
    npm install -g firebase-tools
    echo "✅ Firebase CLI installed successfully!"
else
    echo "✅ Firebase CLI is already installed (version $(firebase --version))"
fi

echo ""
echo "📋 Pre-deployment checklist:"
echo ""

# Check if firebase.json exists
if [ -f "firebase.json" ]; then
    echo "✅ firebase.json found"
else
    echo "❌ firebase.json not found"
    exit 1
fi

# Check if .firebaserc exists
if [ -f ".firebaserc" ]; then
    echo "✅ .firebaserc found"
else
    echo "❌ .firebaserc not found"
    exit 1
fi

# Check if index.html exists
if [ -f "index.html" ]; then
    echo "✅ index.html found"
else
    echo "❌ index.html not found"
    exit 1
fi

echo ""
echo "🔐 Checking Firebase authentication..."
echo ""

# Check if user is logged in
if firebase projects:list &> /dev/null; then
    echo "✅ Already logged in to Firebase"
else
    echo "❌ Not logged in to Firebase"
    echo "Please run: firebase login"
    echo ""
    read -p "Would you like to login now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        firebase login
    else
        echo "Deployment cancelled. Please run 'firebase login' before deploying."
        exit 1
    fi
fi

echo ""
echo "🚀 Starting deployment..."
echo ""

# Deploy to Firebase Hosting
firebase deploy --only hosting

echo ""
echo "✅ Deployment complete!"
echo ""
echo "Your site is now live at:"
echo "  • https://mexiquenseweb-4931b.web.app"
echo "  • https://mexiquenseweb-4931b.firebaseapp.com"
echo ""
echo "📊 View your site in Firebase Console:"
echo "  https://console.firebase.google.com/project/mexiquenseweb-4931b/hosting"
echo ""
