const jwt = require("jsonwebtoken");


module.exports = (req,res,next) => {
    const authHeader = req.headers.authorization;

    if(!authHeader){
        return res.status(401).json({msg: "No token informado"})
    }
        

    const parts = authHeader.split(' ');

    if(!parts.length === 2){
        return res.status(401).send({error: "Token Invalid"})
    }
    const [scheme,token] = parts


    if(!/^Bearer$/i.test(scheme)){
        return res.status(401).send({error: "Token malformated"});
    }

    jwt.verify(token,"DHASUDHASUHDASUIHBDIUASBHN", (err,decode) => {
        if(err) return res.status(401).send({error: "Tokén invalid"});

        req.userId = decode.id;
        return next();
    });
}