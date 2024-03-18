const { logIn, signUp } = require('../Controllers/AuthController')

const router = require('express').Router()

router
    .route('/')
    .get(logIn)
    .put(signUp)

module.exports = router