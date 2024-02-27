const {AUTH} = require('../Firebase/init')

const createUser = async (req, res) => {
    const {user} = req.body
    // const userRef = await AUTH.createUser(user)
    console.log(user)
    res.json({mssg: 'success', data: userRef})
}

const createUsers = async (req, res) => {
    const {users} = req.body
    const userRefs = await Promise.all(users.map(async user => await AUTH.createUser(user)))
    res.json({mssg: 'success', data: userRefs})
}

module.exports = {
    createUser,
    createUsers
}