import express from 'express'
import Authrouter from './modules/routes/routes'
import {LogMiddleware} from './middlewares/middlewares_log'

const app = express()

app.use(express.json())

app.use(LogMiddleware)
app.get('/', (req,res)=> {
    res.status(200).json({msg: "Bem Vindo a nossa Api"})
});



app.use(Authrouter)

const port = 3000
 
app.listen(port, () => console.log(`Rodou em : http://localhost:${port} 🚀`))