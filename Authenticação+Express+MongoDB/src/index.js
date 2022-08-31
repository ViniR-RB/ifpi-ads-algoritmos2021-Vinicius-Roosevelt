
const express = require('express');
const bodyParser = require('body-parser');




const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

app.get('/', (req,res) => {
    res.send({msg: "Bem vindo a nossa Api"})
})
require('./app/controllers/index')(app)

const port = 3000



app.listen(port,()  =>{
    console.log(`Sever Rodando em http://localhost:${port}`)
})