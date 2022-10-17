
import './Player.css'
export default function Players() {

    const players = ['Vini Jr','Neymar','CR7', 'Messi']
    return (
        <div>
            <ul>
            {players.map(player => <li>{player}</li>)}
            </ul>
        </div>
    )
}