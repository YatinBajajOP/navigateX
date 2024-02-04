import { configureStore } from '@reduxjs/toolkit'
import RouteReducer from './RouteStore'
import LogReducer from './LogStore'

const store = configureStore({
  reducer: {
    routes: RouteReducer,
    logs: LogReducer,
  }
})

export default store