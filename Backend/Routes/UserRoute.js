const { createUser, createUsers, deleteUsers } = require('../Controllers/FirebaseController')

const router = require('express').Router()

router
    .route('/')
    .put(createUser)
    .post(createUsers)
    .delete(deleteUsers)
    
// router
//     .route('/:id')
//     .get(getMessages)
//     .post(sendMessage)

module.exports = router