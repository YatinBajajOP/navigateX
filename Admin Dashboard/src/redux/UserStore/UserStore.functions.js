import { getUsers } from "../../firebase/firestore/users"

export const getAllUsers = async () => {
    return await getUsers()
}