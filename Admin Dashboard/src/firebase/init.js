import { initializeApp } from "firebase/app";
import { getFirestore } from 'firebase/firestore';
import { getAuth } from 'firebase/auth';
import firebaseConfig from "./config";

const app = initializeApp(firebaseConfig);
const DB = getFirestore(app);
const AUTH = getAuth(app);

export { DB, AUTH }