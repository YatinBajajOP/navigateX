import { DB } from "../init"
import { doc, getDoc, getDocs, collection, setDoc } from "firebase/firestore"
import { getUser } from './users'

const LOGS = collection(DB, "logs")

export const getLog = async (ref) => {
    const log = await getDoc(ref)
    // return {
    //     id: user.id,
    //     display_name: user.data().display_name
    // }
}

export const getLogs = async (ref) => {
    const logs = await getDocs(LOGS)
    let logs_data = []
    logs.forEach((log) => logs_data.push({
        ...log.data(),
        id: log.id
    }))
    logs_data = await Promise.all(logs_data.map(async log => ({
        id: log.id,
        action: log.action,
        timestamp: log.timestamp?.toMillis(),
        taken_by: await getUser(log.taken_by),
        target: await getUser(log.target),
    })))
    return logs_data
    // return {
    //     id: user.id,
    //     display_name: user.data().display_name
    // }
}