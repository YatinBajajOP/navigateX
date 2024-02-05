import { createAsyncThunk } from '@reduxjs/toolkit'
import { getAllRoutes } from './RouteStore.functions';

export const GET_ROUTES = createAsyncThunk(
    'ROUTES/GET_ALL',
    async (thunkAPI) => {
        return await getAllRoutes()
    },
)