import {Request,Response ,NextFunction } from "express";
import jwt from 'jsonwebtoken'
import 'dotenv/config'

 function checkToken(req:Request,res: Response, next: NextFunction){
    const authHeader = req.headers.authorization
    
    if(!authHeader) return res.status(400).json({msg: "Token is missing"})
    try{
        const [,token] = authHeader.split(" ")
        const secret = process.env.SECRET
        jwt.verify(token,secret!);
        return next()
    }catch(err){
        res.status(401).json({msg: "Token Invalid"})
    }
}
export default checkToken