import { configureStore } from '@reduxjs/toolkit'
import RouteReducer from './RouteStore'
import UserReducer from './UserStore'
import FeedbackReducer from './FeedbackStore'
import LogReducer from './LogStore'


const store = configureStore({
  reducer: {
    routes: RouteReducer,
    users: UserReducer,
    feedbacks: FeedbackReducer,
    logs: LogReducer,
  }
})

export default store