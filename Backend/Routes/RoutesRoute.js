const { getRouteForUser, createRoute, updateRoute, setUserStatusInRoute } = require('../Controllers/RouteController')

const router = require('express').Router()

router
    .route('/')
    .get(getRouteForUser)
    .post(createRoute)
    .put(setUserStatusInRoute)
    .patch(updateRoute)

module.exports = router