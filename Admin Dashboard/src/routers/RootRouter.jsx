import { Route, Routes } from "react-router-dom";
import ROUTES from '../pages/Routes/Routes'
import Logs from "../pages/Logs/logs";
import Users from "../pages/Users/users";
import Feedback from "../pages/Feedback/feedback";

export const RootRouter = () => {
    return (
        <Routes>
            <Route path="*" element={<ROUTES />} />
            <Route path="/routes" element={<ROUTES />} />
            <Route path="/logs" element={<Logs />} />
            <Route path="/users" element={<Users />} />
            <Route path="/feedback" element={<Feedback />} />
        </Routes>
    );
};

export default RootRouter;