const { createUser, createUsers } = require('../Controllers/FirebaseController')

const router = require('express').Router()

router
    .route('/')
    .put(createUser)
    .post(createUsers)
    
// router
//     .route('/:id')
//     .get(getMessages)
//     .post(sendMessage)

module.exports = router