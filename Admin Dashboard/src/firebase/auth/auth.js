import { createUserWithEmailAndPassword } from 'firebase/auth'
import { AUTH } from '../init'

export const createUser = async (email, password, user) => {
    const res = await createUserWithEmailAndPassword(AUTH, email, password)
    // createUserDocument(res.user.uid, user)
    console.log(res)
}

export const createUsers = async (formData) => {
  console.log(formData)
}