import { createAsyncThunk } from '@reduxjs/toolkit'
import { ImportUsers, getAllUsers } from './UserStore.functions';
import CustomAxios from '../../Axios';

export const GET_USERS = createAsyncThunk(
    'USERS/GET_ALL',
    async (thunkAPI) => {
        return await getAllUsers()
    },
)

export const IMPORT_USERS = createAsyncThunk(
    'USERS/IMPORT_USERS',
    async (users, thunkAPI) => {
        return await ImportUsers(users)
    },
)