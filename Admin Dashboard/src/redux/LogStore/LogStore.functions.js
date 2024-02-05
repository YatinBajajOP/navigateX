import { getLogs } from "../../firebase/firestore/logs"

export const getAllLogs = async () => {
    return await getLogs()
}