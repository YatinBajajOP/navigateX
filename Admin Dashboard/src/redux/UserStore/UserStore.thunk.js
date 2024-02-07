import { createAsyncThunk } from '@reduxjs/toolkit'
import { getAllUsers } from './UserStore.functions';

export const GET_USERS = createAsyncThunk(
    'USERS/GET_ALL',
    async (thunkAPI) => {
        return await getAllUsers()
    },
)