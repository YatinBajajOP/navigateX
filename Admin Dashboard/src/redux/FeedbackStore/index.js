import { createSlice } from '@reduxjs/toolkit'
import { GET_FEEDBACKS } from './FeedbackStore.thunk'


const initialState = {
  feedbacks: []
}

export const FeedbackStore = createSlice({
  name: 'feedbacks',
  initialState,
  reducers: {
    // set: (state, action) => state.routes = action.payload,
    // add: (state, action) => state.routes = state.routes.push(action.payload),
    // update: (state, action) => state.routes = state.routes.map(route => route.id === action.payload.id ? action.payload.route : route),
    // remove: (state, action) => state.routes = state.routes.filter(route => route.id !== action.payload.id),
    // clear: (state) => state.routes = [],
  },
  extraReducers: (builder) => {
    builder.addCase(GET_FEEDBACKS.fulfilled, (state, action) => {
      state.feedbacks = action.payload
    })
  },
})

// Action creators are generated for each case reducer function
export const { set, add, update, remove, clear } = FeedbackStore.actions
const FeedbackReducer = FeedbackStore.reducer
export default FeedbackReducer