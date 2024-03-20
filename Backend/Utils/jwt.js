const jwt = require('jsonwebtoken')

const createToken = (id) => {
    return jwt.sign({ id }, process.env.JWT_SECRET_KEY)
}

const isAuthenticated = (token) => {
    return jwt.verify(token, process.env.JWT_SECRET_KEY)
}

module.exports  = { createToken, isAuthenticated }