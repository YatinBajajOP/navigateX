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
        createUser(e.target.email, )
    }
    return (
        <>
            <div style={{ margin: '1rem auto 0.6rem', padding: '1rem 2rem', backgroundColor: 'var(--clr-primary)', color: 'white', width: 'fit-content', cursor: 'pointer' }} onClick={() => setModalOpen(true)} >Add User</div>
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
                ? (<div style={{ position: 'absolute', top: 0, left: 0, width: '100vw', height: '100vh', backgroundColor: 'rgb(0,0,0,0.7)', display: 'grid', placeItems: 'center' }}>
                    <form style={{ display: 'flex', padding: '1rem', flexDirection: 'column', gap: '1rem', alignItems: 'center', color: 'white' }} onSubmit={handleSubmit} >
                        <p style={{cursor: 'pointer'}} onClick={() => setModalOpen(false)}>X</p>
                        <input type='text' name='name' placeholder="Full Name" />
                        <label htmlFor="isDriver">Is a driver</label>
                        <input type='checkbox' name='isDriver' id='isDriver' value='true' />
                        <input type='text' name='email' placeholder="email Id" />
                    </form>
                </div>)
                : null
            }
        </>
    )
}

export default Users