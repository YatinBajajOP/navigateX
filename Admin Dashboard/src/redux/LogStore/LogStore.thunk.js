import { createAsyncThunk } from '@reduxjs/toolkit'
import { getAllLogs } from './LogStore.functions';

export const GET_LOGS = createAsyncThunk(
    'LOGS/GET_ALL',
    async (thunkAPI) => {
        return await getAllLogs()
    },
)