import { createSlice } from '@reduxjs/toolkit'
import { GET_ROUTES } from './RouteStore.thunk'

const initialState = {
  routes: []
}

export const RouteStore = createSlice({
  name: 'routes',
  initialState,
  reducers: {
    set: (state, action) => state.routes = action.payload,
    add: (state, action) => state.routes = state.routes.push(action.payload),
    update: (state, action) => state.routes = state.routes.map(route => route.id === action.payload.id ? action.payload.route : route),
    remove: (state, action) => state.routes = state.routes.filter(route => route.id !== action.payload.id),
    clear: (state) => state.routes = [],
  },
  extraReducers: (builder) => {
    builder.addCase(GET_ROUTES.fulfilled, (state, action) => {
      state.routes = action.payload
    })
  },
})

// Action creators are generated for each case reducer function
export const { set, add, update, remove, clear } = RouteStore.actions
const RouteReducer = RouteStore.reducer
export default RouteReducer