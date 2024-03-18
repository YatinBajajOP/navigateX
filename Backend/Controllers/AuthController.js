const AUTH = require('../Models/AuthModel')
const USERS = require('../Models/UserModel')
const { createToken } = require('../Utils/jwt')
const bcrypt = require('bcrypt')

const signUp = async (req, res) => {
    const { username, password, user } = req.body
    try {
        if (!username) throw Error('Username not present')
        if (!password) throw Error('Password not present')
        if (!user) throw Error('User profile data not present')
        if (!user.name) throw Error('name of user is not present')
        if (!user.location) throw Error('user location not present')
        if (!user.address) throw Error('user Address not present')
        if (!user.role) throw Error('user role not present')
        if (user.role === 'driver' && !user.phn) throw Error('phone number of driver not provided')

        if (await AUTH.findOne({ username })) throw Error(`user with username ${username} already in exists`)

        const salt = await bcrypt.genSalt(10)
        const hash = await bcrypt.hash(password, salt)
        const userAuth = await AUTH.create({ username, password: hash })

        user._id = userAuth._id
        const profile = await USERS.create(user)

        const token = createToken(profile._id)

        return res.json({ msg: 'Successfully created a user', data: token })

    } catch (e) {
        return res.status(400).json({ msg: e.message })
    }
}

const logIn = async (req, res) => {
    const { username, password } = req.body

    try {
        const user = await AUTH.findOne({ username })
        if (!user) throw new Error(`user with username ${username} doesnot exist`)

        const isMatch = await bcrypt.compare(password, user.password)
        if (!isMatch) throw new Error('Invalid password')

        const token = createToken(user._id)
        return res.json({ msg: 'Successfully logged in', data: token })

    } catch (e) {
        return res.status(400).json({ msg: e.message })
    }
}

module.exports = { signUp, logIn }