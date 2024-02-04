import { createAsyncThunk } from '@reduxjs/toolkit'
import { getAllLogs } from './LogStore.functions';

export const GET_LOGS = createAsyncThunk(
    'ROUTES/GET_ALL',
    async (thunkAPI) => {
        return await getAllLogs()
    },
)