import LOGO from '../../assets/fil_logo_1.png'
import './Navbar.css'

const Navbar = () => {
    return(
        <nav>
            <div>
                <img src={LOGO} alt="logo"></img>
            </div>
            <div className="nav_links">
                <a>Routes</a>
                <a>Logs</a>
                <a>Profiles</a>
                <a>Feedback</a>
                <a>Logout</a>
            </div>
        </nav>
    )
}

export default Navbar