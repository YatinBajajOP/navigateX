import { isAuthenticated } from "../Utils/jwt";

export const authRequired = (req, res, next) => {
    // Get token from header
    const token = req.header('x-auth')
    
    if (!token) {
        return res.status(401).json({ msg: "No token provided"})
    }

    try {
        // Verify token
        const user = isAuthenticated(token)
        
        // Add user from payload to request object
        req.user = user; 
        console.log("User", req.user)
        next();
    } catch (err) {
    
    }
}