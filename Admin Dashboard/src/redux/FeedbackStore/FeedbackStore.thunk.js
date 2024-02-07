import { createAsyncThunk } from '@reduxjs/toolkit'
import { getAllFeedbacks } from './FeedbackStore.functions';

export const GET_FEEDBACKS = createAsyncThunk(
    'FEEDBACKS/GET_ALL',
    async (thunkAPI) => {
        return await getAllFeedbacks()
    },
)