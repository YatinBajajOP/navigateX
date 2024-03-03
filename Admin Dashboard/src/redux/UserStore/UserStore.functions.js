import { getUsers } from "../../firebase/firestore/users"

export const getAllUsers = async () => {
    return await getUsers()
}

export const ImportUsers = async (users) => {
    return CustomAxios.post('/users', users)
}