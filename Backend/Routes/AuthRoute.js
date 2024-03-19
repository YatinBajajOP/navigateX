const { getUser, logIn, signUp } = require('../Controllers/AuthController')

const router = require('express').Router()

router
    .route('/')
    .get(getUser)
    .post(logIn)
    .put(signUp)

module.exports = router