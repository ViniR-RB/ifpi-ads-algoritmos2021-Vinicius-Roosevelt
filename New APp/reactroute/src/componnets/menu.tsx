import { Link } from "react-router-dom";

export default function Header() {
    return (
        <header>
            <h1>Copa do Mundo 2022</h1>
            <nav>
                <ul>
                    <li><Link to="/">Home</Link></li>
                    <li><Link to="/times">Teams</Link></li>
                    <li><Link to="/players">Players</Link></li>

                </ul>
            </nav>
        </header>
    );
}