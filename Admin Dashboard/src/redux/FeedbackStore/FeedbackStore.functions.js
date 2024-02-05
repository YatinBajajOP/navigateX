import { getFeedbacks } from "../../firebase/firestore/feedbacks"

export const getAllFeedbacks = async () => {
    return await getFeedbacks()
}