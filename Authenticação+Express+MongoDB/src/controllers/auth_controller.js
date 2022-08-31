const express = require('express')
const bcrypt = require('bcryptjs')
const User = require('../models/user')
const jwt = require('jsonwebtoken')


const env = require('../../.env')
const router = express.Router();


function generateToken(params = {}){
    return  jwt.sign(params,"DHASUDHASUHDASUIHBDIUASBHN", {
        expiresIn: "86400"
    });
}
router.post('/register', async (req,res) =>{
    const {email} = req.body

    try{
        if(await User.findOne({email}))
            return res.status(401).send({msg: "Usuario já cadastrado"})

        const user = await User.create(req.body);


        user.password = undefined


        return res.send({user,
        token: generateToken({id: user.id})
        });



    }catch(err){
        res.status(400).send({error: 'Registro Fail'})
    }
});
router.post('/login', async (req,res) =>{
    const {email,password} = req.body;

    const user = await User.findOne({email}).select('+password')
    if(!user)
        return res.status(500).json({msg: "Usuario ou Senha Incorretos"})
    if(!await bcrypt.compare(password,user.password))
        return res.status(400).json({msg : "Usuario ou Senha Incorretos"})
        user.password = undefined
        
        


        res.send({user,
            token: generateToken({id: user.id})});
    
});


module.exports = app => app.use('/auth', router)