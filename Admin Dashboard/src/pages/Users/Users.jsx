import { useEffect, useState } from "react"
import { useSelector } from "react-redux"
import { useDispatch } from "react-redux"
import { GET_USERS } from "../../redux/UserStore/UserStore.thunk";
import './Users.css'
import { createUser } from "../../firebase/auth/auth";

const Users = () => {
    const users = useSelector((state) => state.users.users)
    const [modalOpen, setModalOpen] = useState(false)
    const dispatch = useDispatch()
    useEffect(() => {
        dispatch(GET_USERS())
    }, [])

    const handleSubmit = async (e) => {
        e.preventDefault()
        createUser(e.target.email,)
    }
    return (
        <>
            <div className="Add-User-btn" onClick={() => setModalOpen(true)} >Add User</div>
            <div className="container">
                <div className="user_wrapper">
                    {users.map((user, index) => (
                        <div className="card-item" key={user.id}>
                            <div className="card-item-index" index={index}>
                                <div className="card-item-content">
                                    <p>{user?.id}</p>
                                    <p>{user?.display_name}</p>
                                    <p>{user?.email}</p>
                                    <p>{new Date(user?.created_time).toLocaleString()}</p>
                                    <p>{user?.isDriver ? "Driver" : "Employee"}</p>
                                </div>
                            </div>
                        </div>))}
                </div>
            </div>
            {
                modalOpen
                    ? (<div className="Add-User-Modal">
                        <form onSubmit={handleSubmit} >
                            <p onClick={() => setModalOpen(false)}>X</p>

                            <div className="input-wrapper">
                                <input type='text' name='name' placeholder="Full Name" />
                                <div className="driver-check">
                                    <label htmlFor="isDriver">Is a driver</label>
                                    <input type='checkbox' name='isDriver' id='isDriver' value='true' />
                                </div>
                                <input type='email' name='email' placeholder="email Id" />
                            </div>
                        </form>
                    </div>)
                    : null
            }
        </>
    )
}

export default Users