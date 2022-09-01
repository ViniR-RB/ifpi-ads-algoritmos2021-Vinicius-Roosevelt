const express = require('express')
const bcrypt = require('bcryptjs')
const User = require('../../app/models/user')
const jwt = require('jsonwebtoken')
const mailer = require('../modules/mailer')
const crypto = require('crypto')



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

router.post('/forgot_password', async(req,res) => {
    const {email} = req.body

    try{    
        const user = await User.findOne({email});
        if(!user){
            return res.status(400).send({err:"User Not Found"}) 
        }
        const token = crypto.randomBytes(20).toString('hex');
        const now = new Date()
        now.setHours(now.getHours() + 1);

        await User.findByIdAndUpdate(user.id, {
            '$set': {
                passwordResetToken: token,
                passwordResetExpires: now
            }
        });


        mailer.sendMail({
            to: email,
            from: 'viniciusmultlan@gmail.com',
            template: 'auth/forgot_password',
            context: {token}
        }), (err) => {
            if (err){
                return res.status(400).send({err: "Erro em enviar o reset para email"})
            }
        }
        res.send();



    }catch(err){
        
        res.status(400).send({err: "Error em redefinir a senha tente novamente"})
    }
});


router.post('/reset_password', async (req,res) => {
    const {email,token,password} = req.body

    try{
        const user = await User.findOne({email}).select('+passwordResetToken passwordResetExpires');
        if(!user){
            res.status(400).json({msg: "Email ou token inválido"})
        }
        if(token !== user.passwordResetToken){
            res.status(400).send({error: "Token invalid"})
        }
        const now = new Date();
        if(now > user.passwordResetExpires){
            res.status(400).json({err: "Token Expired"})
        }
        user.password = password;
        
        await user.save();

        res.send();
    }
    catch(err){
        res.status(400).send({msg: "Não foi possível resetar sua senha"})
    }
});
module.exports = app => app.use('/auth', router)