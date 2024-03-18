const jwt = require('jsonwebtoken')

const createToken = (_id) => {
    return jwt.sign({ _id }, process.env.JWT_SECRET_KEY)
}

const isAuthenticated = (token) => {
    return jwt.verify(token, process.env.JWT_SECRET_KEY)
}

module.exports  = { createToken, isAuthenticated }