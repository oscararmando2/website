// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
// NOTE: This is the canonical Firebase configuration for npm-based builds.
// For the static HTML site (index.html), the configuration is embedded directly
// using the CDN approach for simplicity.
const firebaseConfig = {
  apiKey: "AIzaSyB_5GFz2nM55vesrFvFE5QHSXaGxfuuZ9A",
  authDomain: "mexiquenseweb-4931b.firebaseapp.com",
  projectId: "mexiquenseweb-4931b",
  storageBucket: "mexiquenseweb-4931b.firebasestorage.app",
  messagingSenderId: "416413628432",
  appId: "1:416413628432:web:48c17c2be2238fd17e3295",
  measurementId: "G-VWBPN4DQJE"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

export { app, analytics };
