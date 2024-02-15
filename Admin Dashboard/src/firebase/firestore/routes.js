import { DB } from "../init"
import { doc, getDoc, getDocs, collection, setDoc, deleteDoc, query } from "firebase/firestore"
import { getUser } from "./users"
import { getVehicle } from "./vehicle"

const ROUTES = collection(DB, "route_data")

export const createRoute = async (data) => {
    return await setDoc(doc(ROUTES), data)
}

export const createRoutes = async (routes) => {
  await Promise.all(routes.map(async route => await setDoc(doc(ROUTES), route)))
}

export const getRoutes = async () => {
    const routes = await getDocs(ROUTES)
    let result = []
    routes.forEach(route => {
        const data = route.data()
        result.push({
            id: route.id,
            address: data.address,
            driver: data.driver,
            driver_location: {lat: data.driver_location?.latitude, long: data.driver_location?.longitude},
            employee: data.employee,
            eta: data.eta.toMillis(),
            locaion: {lat: data.location?.latitude, long: data.location?.longitude},
            name: data.name,
            shift: data.shift.toMillis(),
            status: data.status,
            vehicle: data.vehicle
        })
    })
    result = await Promise.all(result.map(async route => ({
        ...route,
        driver: await getUser(route.driver),
        employee: await getUser(route.employee),
        vehicle: await getVehicle(route.vehicle)
    })))
    let res = {}
    result.forEach(route => {
        if(res[`${route?.driver?.id}${new Date(route?.shift).toLocaleString()}`] instanceof Array) res[`${route?.driver?.id}${new Date(route?.shift).toLocaleString()}`].push(route)
        else res[`${route?.driver?.id}${new Date(route?.shift).toLocaleString()}`] = [route]
    })
    return res
}

export const updateRoute = async (route, data) => {
    const ref = doc(ROUTES, route.id)
    return setDoc(ref, data, {merge : true})
}

export const deleteUserFromRoute = async (route_user) => {
  await deleteDoc(doc(ROUTES, route_user.id))
}

export const deleteRoute = async (route) => {
    await Promise.all(route.map(async user => await deleteDoc(doc(ROUTES, user.id))))
}

export const deleteRoutes = async (routes) => {
    await Promise.all(routes.map(async route => await deleteDoc(doc(ROUTES, route.id))))
}

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

// export const userSwiped = async (user, swiped, col) => {
//     return setDoc(doc(db, "users", user.uid, col, swiped.id), swiped)
// }

// export const match = async (user, id) => {
//     return getDoc(doc(db, "users", id, "MATCH", user.uid))
// }

// export const getPandM = async (user, col) => {
//     return getDocs(collection(db, "users", user.uid, col))
// }

// export const createChat = async (id, data) => {
//     return setDoc(doc(db, "chat", id), data)
// }