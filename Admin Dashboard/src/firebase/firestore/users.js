import { DB } from "../init"
import { doc, getDoc, getDocs, collection, setDoc } from "firebase/firestore"

const USERS = collection(DB, "users")

export const createUserDocument = async (id) => {
    const ref = doc(USERS, id)
    return await setDoc(ref, { createdAt: new Date() })
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
        return 0;
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