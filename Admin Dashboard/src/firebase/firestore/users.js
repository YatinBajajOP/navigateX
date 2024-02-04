import { DB } from "../init"
import { doc, getDoc, getDocs, collection, setDoc } from "firebase/firestore"

const USERS = collection(DB, "users")
export const getUser = async (ref) => {
    const user = await getDoc(ref)
    return {
        id: user.id,
        display_name: user.data().display_name
    }
}