import { useEffect, useState } from "react"
import { useSelector } from "react-redux"
import { useDispatch } from "react-redux"
import { GET_USERS, IMPORT_USERS } from "../../redux/UserStore/UserStore.thunk";
import './Users.css'

const Users = () => {
    const users = useSelector((state) => state.users.users)
    const [modal, setModal] = useState('')
    const dispatch = useDispatch()
    useEffect(() => {
        dispatch(GET_USERS())
    }, [])

    const handleAddSubmit = async (e) => {
        e.preventDefault()
        // createUser(e.target.email,)
    }

    const handleImportSubmit = async (e) => {
        e.preventDefault()
        const form = e.target
        const reader = new FileReader()
        reader.onload = () => {
            const data = reader.result
            let users = data.split('\n').slice(1)
            users = users.map(user => {
                const info = user.split(',')
                return {
                    email: info[0],
                    password: info[2].split(' ')[0],
                    AID: info[1],
                    display_name: info[2],
                    isDriver: info[3],
                    Address: info[4],
                    geolocation: info[5]
                }
            })
            console.log(users)
            // dispatch(IMPORT_USERS)
        }
        reader.readAsBinaryString(form.file.files[0])
    }

    return (
        <>
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '1rem', marginRight: '4.2rem' }}>
                <div className="add-user-btn" onClick={() => setModal('ADD')} >Add User</div>
                <div className="import-user-btn" onClick={() => setModal('IMPORT')} >Import Users</div>
            </div>
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
                modal === 'ADD'
                    ? (<div className="Add-User-Modal">
                        <form onSubmit={handleAddSubmit} >
                            <p onClick={() => setModal('')}>X</p>
                            <div className="input-wrapper">
                                <input type='text' name='name' placeholder="Full Name" />
                                <label className="driver-check" htmlFor="isDriver">
                                    <p>Is a Driver</p>
                                    <input type='checkbox' name='isDriver' id='isDriver' value='true' />
                                </label>
                                <input type='email' name='email' placeholder="Email Id" />
                                <input type='password' name='passwoord' placeholder="Password" />
                                <button>Submit</button>
                            </div>
                        </form>
                    </div>)
                    : null
            }
            {
                modal === 'IMPORT'
                    ? (<div className="Add-User-Modal">
                        <form onSubmit={handleImportSubmit} >
                            <p onClick={() => setModal('')}>X</p>
                            <div className="input-wrapper">
                                <label style={{ width: '20rem', height: '20rem', display: 'grid', placeItems: 'center', border: '1px dashed black' }} htmlFor='import-file-input' ></label>
                                <input type='file' id='import-file-input' style={{ display: 'none' }} name='file' />
                                <button>Import</button>
                            </div>
                        </form>
                    </div>)
                    : null
            }
        </>
    )
}

export default Users