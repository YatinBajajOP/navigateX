const { createUser } = require('../Controllers/FirebaseController')

const router = require('express').Router()

router
    .route('/')
    // .get(createUser)
    .put(createUser)
    
// router
//     .route('/:id')
//     .get(getMessages)
//     .post(sendMessage)

module.exports = router