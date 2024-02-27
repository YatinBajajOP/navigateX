const { initializeApp } = require('firebase-admin/app')
const { getFirestore } = require('firebase-admin/firestore')
const { getAuth } = require('firebase-admin/auth')
const firebaseConfig = require('./config')

const app = initializeApp(firebaseConfig)
const DB = getFirestore(app)
const AUTH = getAuth(app)

module.exports = { DB, AUTH }