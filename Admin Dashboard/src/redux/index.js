import { configureStore } from '@reduxjs/toolkit'
import RouteReducer from './RouteStore'

const store = configureStore({
  reducer: {
    routes: RouteReducer,
  }
})

export default store