import { AUTH, createUserWithEmailAndPassword } from '../init'

export const createUser = async (email, password) => {
    const res = await createUserWithEmailAndPassword(AUTH, email, password)
    // createUserDocument()
    console.log(res)
}
