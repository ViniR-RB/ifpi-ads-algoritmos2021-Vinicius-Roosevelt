import './Teams.css'
export default function Teams() {

    const teams = ['Brazil','France','Germany', 'USA']
    return (
        <div>
            <ul>
            {teams.map(team => <li>{team}</li>)}
            </ul>
        </div>
    )
}