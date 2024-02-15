import { DB } from "../init"
import { doc, getDoc, getDocs, collection, setDoc } from "firebase/firestore"

const USERS = collection(DB, "users")

export const createUserDocument = async (id, user) => {
    const ref = doc(USERS, id)
    return await setDoc(ref, user)
}

export const getUser = async (ref) => {
    if(!ref) return null
    try{
        const user = await getDoc(ref)
        return {
            id: user.id,
            display_name: user.data().display_name
        }
    }
    catch(e){
        console.log(e)
        return {};
    }
}

export const getUserById = async (id) => {
  if(!id) return
  try{
    const user = await getDoc(doc(USERS, id))
    user
  } catch(e) {
    console.log(e)
    return null
  }
}

export const getUsers = async () => {
    const users= await getDocs(USERS);
    let result = []
    users.forEach((doc)=>{
        result.push({
            id: doc.id,
            display_name:  doc.data().display_name,
            created_time:  doc.data().created_time.toMillis(),
            isDriver: doc.data().isDriver,
            email: doc.data().email
        })
    });
    console.log(result)
    return result
}