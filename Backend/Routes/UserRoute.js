const { createUser, createUsers, deleteUsers } = require('../Controllers/FirebaseController')

const router = require('express').Router()

router
    .route('/')
    .put(createUser)
    .post(createUsers)
    .delete(deleteUsers)

module.exports = router