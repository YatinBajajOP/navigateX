import { Link } from "react-router-dom";
import LOGO from '../../assets/fil_logo_1.png'
import './Navbar.css'

const Navbar = () => {
    return(
        <nav>
            <div>
                <img src={LOGO} alt="logo"></img>
            </div>
            <div className="nav_links">
                <Link to='routes'>Routes</Link>
                <Link to='logs'>Logs</Link>
                <Link to='users'>Users</Link>
                <Link to='feedback'>Feedback</Link>
                <a>Logout</a>
            </div>
        </nav>
    )
}

export default Navbar