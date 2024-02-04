import { createSlice } from '@reduxjs/toolkit'
import { GET_LOGS } from './LogStore.thunk'

const initialState = {
  logs: []
}

export const LogStore = createSlice({
  name: 'logs',
  initialState,
  reducers: {
    // set: (state, action) => state.routes = action.payload,
    // add: (state, action) => state.routes = state.routes.push(action.payload),
    // update: (state, action) => state.routes = state.routes.map(route => route.id === action.payload.id ? action.payload.route : route),
    // remove: (state, action) => state.routes = state.routes.filter(route => route.id !== action.payload.id),
    // clear: (state) => state.routes = [],
  },
  extraReducers: (builder) => {
    builder.addCase(GET_LOGS.fulfilled, (state, action) => {
      state.logs = action.payload
    })
  },
})

// Action creators are generated for each case reducer function
// export const { set, add, update, remove, clear } = LogStore.actions
const LogReducer = LogStore.reducer
export default LogReducer