const { AUTH, DB } = require('../Firebase/init')
import { doc, collection, setDoc } from 'firebase/firestore';

const USERS = collection(DB, "users")

const createUser = async (req, res) => {
    const user = req.body
    const userRef = await AUTH.createUser()
    await setDoc(doc(USERS, userRef.uid), user)
    res.json({mssg: 'success', data: userRef.uid})
}

const createUsers = async (req, res) => {
    const users = req.body
    let mapping = {}
    // const userRefs = await Promise.all(users.map(async user => {
    //     const userRef = await AUTH.createUser({email: user.email, password: user.password})
    //     user.id = userRef.uid
    //     await setDoc(doc(USERS, userRef.uid), user)
    //     mapping[user.password] = userRef.uid
    //     return userRef.uid
    // }))
    res.json({mssg: 'success', data: users})
}

module.exports = {
    createUser,
    createUsers
}