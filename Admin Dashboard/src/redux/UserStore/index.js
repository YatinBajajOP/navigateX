import { createSlice } from '@reduxjs/toolkit'
import { GET_USERS } from './UserStore.thunk'



const initialState = {
  users: []
}

export const UserStore = createSlice({
  name: 'users',
  initialState,
  extraReducers: (builder) => {
    builder.addCase(GET_USERS.fulfilled, (state, action) => {
      state.users = action.payload
    })
  },
})

// Action creators are generated for each case reducer function
// export const { set, add, update, remove, clear } = UserStore.actions
const UserReducer = UserStore.reducer
export default UserReducer