const admin = require("firebase-admin");

const serviceAccount = require("./serviceAccountKey.json"); // Replace with the actual path

// Initialize the app with downloaded service account credentials
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

module.exports = admin;
