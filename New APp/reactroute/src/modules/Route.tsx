import { Routes, Route } from "react-router-dom";
import Home from "./home/Home";
import Players from "./player/Player";
import Teams from "./teams/Teams";

export default function AppRoutes() {
    return (
        <Routes>
            <Route path="/" element={<Home />} />
            <Route path='/times' element={<Teams />} />
            <Route path='/players' element={<Players />} />
        </Routes>
    );
}