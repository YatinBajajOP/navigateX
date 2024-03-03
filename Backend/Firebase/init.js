const { initializeApp, applicationDefault, cert } = require('firebase-admin/app')
const { getFirestore } = require('firebase-admin/firestore')
const { getAuth } = require('firebase-admin/auth')
const firebaseConfig = require('./config')
const secretKey = require('../FirebaseServiceKey.json')

const app = initializeApp({
    credential: cert(secretKey),
    ...firebaseConfig
})
const DB = getFirestore(app)
const AUTH = getAuth(app)

module.exports = { DB, AUTH }