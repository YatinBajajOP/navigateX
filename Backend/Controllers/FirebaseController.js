const { AUTH, DB } = require('../Firebase/init')
const { setDoc, doc, Timestamp, GeoPoint} = require('firebase-admin/firestore')

const USERS = DB.collection("users")

const createUser = async (req, res) => {
    const user = req.body
    const userRef = await AUTH.createUser({email: user.email, password: user.password})
    console.log(`{"${user.AID}": "${userRef.uid}"}`)
    delete user.AID
    delete user.password
    user.id = userRef.uid
    user.created_time = Timestamp.fromDate(new Date())
    user.location = GeoPoint(user.location)
    await USERS.doc(userRef.uid).set(user)
    res.json({mssg: 'success', data: userRef.uid})
}

const createUsers = async (req, res) => {
    const users = req.body
    let mapping = {}
    const userRefs = await Promise.all(users.map(async user => {
        try{
            const userRef = await AUTH.createUser({email: user.email, password: user.password})
            mapping[user.AID] = userRef.uid
            delete user.AID
            delete user.password
            user.id = userRef.uid
            user.created_time = Timestamp.fromDate(new Date())
            user.location = new GeoPoint(parseFloat(user.location.split(',')[0].trim()), parseFloat(user.location.split(',')[1].trim()))
            await USERS.doc(userRef.uid).set(user)
            return userRef.uid
        } catch (e) {
            console.log(user)
            console.log(e)
        }
    }))
    console.log(mapping)
    res.json({mssg: 'success', data: userRefs})
}

const deleteUsers = async (req, res) => {
    const emails = req.body
    try{
        const users = await Promise.all(emails.map(async email => {
            const user = await AUTH.getUserByEmail(email)
            return user.uid
        }))
        await AUTH.deleteUsers(users)
        res.json(users)
    } catch(e) {
        console.log(e)
    }
}

module.exports = {
    createUser,
    createUsers,
    deleteUsers
}