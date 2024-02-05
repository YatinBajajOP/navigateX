import { DB } from "../init"
import { doc, getDoc, getDocs, collection, setDoc } from "firebase/firestore"
import { getUser } from "./users";


const FEEDBACKS = collection(DB, "feedbacks")
export const getFeedbacks = async () => {
    const feedbacks= await getDocs(FEEDBACKS);
    let result = []
    feedbacks.forEach((feedback)=>{
        result.push({
            ...feedback.data(),
            id: feedback.id,
            timestamp:  feedback.data().timestamp?.toMillis(),
            given_by: feedback.data().given_by
        })
    });

    result=await Promise.all(result.map(async feedback => ({
        ...feedback,
        given_by:  await getUser(feedback.given_by)
    })))
    console.log(result)
    return result
} 