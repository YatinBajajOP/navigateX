import Accordian from "../../components/Accordion/Accordian"
import { useSelector } from "react-redux"
import './Users.css'
import { useDispatch } from "react-redux"
import { GET_ROUTES } from '../../redux/RouteStore/RouteStore.thunk';
import { useEffect } from "react"
import { GET_USERS } from "../../redux/UserStore/UserStore.thunk";

const Users = () => {
    const users = useSelector((state) => state.users.users)
    const dispatch = useDispatch()
    useEffect(() => {
        dispatch(GET_USERS())
    }, [])
    return (
        <div className="container">
            <div className="user_wrapper">
                {users.map((user, index) => (
                    <div className="card-item" key={user.id}>
                        <div className="card-item-index" index={index}>
                            <div className="card-item-content">
                                <p>{user?.id}</p>
                                <p>{user?.display_name}</p>
                                <p>{user?.email}</p>
                                <p>{user?.created_time}</p>
                                <p>{user?.isDriver ? "Driver" : "Employee"}</p>
                            </div>
                        </div>
                    </div>))}

            </div>
        </div>)
}

export default Users