import { DB } from "./init"
import { doc, getDoc, getDocs, collection, setDoc } from "firebase/firestore"

const ROUTES = collection(DB, "route_data")

export const getRoutes = async () => {
    const routes = await getDocs(ROUTES)
    let result = []
    // routes.forEach(route => result.push(route.data()))
    routes.forEach(route => {
        const data = route.data()
        result.push({
            id: route.id,
            address: data.address,
            driver: data.driver.id,
            driver_location: {lat: data.driver_location?.latitude, long: data.driver_location?.longitude},
            employee: data.employee.id,
            eta: data.eta.toMillis(),
            locaion: {lat: data.location?.latitude, long: data.location?.longitude},
            name: data.name,
            shift: data.shift.toMillis(),
            status: data.status,
            vehicle: data.vehicle.id
        })
    })
    return result
}

// export const updateUser = async (user, data) => {
//     const ref = doc(USERS, user.uid)
//     return setDoc(ref, data, {merge : true})
// }

// export const getData = async (ref) => {
//     return getDoc(ref)
// }

// export const getProfiles = async () => {
//     return getDocs(USERS)
// }

// export const handleUser = async (user) => {
//     const ref = doc(USERS, user.uid)
//     let snap = null
//     try{
//         snap = await getDoc(ref)
//     }
//     catch(err){
//         console.log(err.message)
//     }
//     if(snap.exists()){
//         return snap.data()
//     }
//     else{
//         return null
//     }
// }

export const userSwiped = async (user, swiped, col) => {
    return setDoc(doc(db, "users", user.uid, col, swiped.id), swiped)
}

export const match = async (user, id) => {
    return getDoc(doc(db, "users", id, "MATCH", user.uid))
}

export const getPandM = async (user, col) => {
    return getDocs(collection(db, "users", user.uid, col))
}

export const createChat = async (id, data) => {
    return setDoc(doc(db, "chat", id), data)
}