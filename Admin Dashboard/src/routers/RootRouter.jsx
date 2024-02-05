import { Route, Routes } from "react-router-dom";
import ROUTES from '../pages/Routes/Routes'
import Logs from "../pages/Logs/Logs";
import Users from "../pages/Users/Users";
import Feedback from "../pages/Feedback/Feedback";

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