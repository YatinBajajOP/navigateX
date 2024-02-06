import { DB } from "../init"
import { doc, getDoc, getDocs, collection, setDoc } from "firebase/firestore"

const VEHICLE = collection(DB, "vehicle_data")
export const getVehicle = async (ref) => {
    const vehicle = await getDoc(ref)
    return {
        id: vehicle.id,
        number: vehicle.data().number,
        seats: vehicle.data().seats,
        vendor: vehicle.data().vendor,
    }
}