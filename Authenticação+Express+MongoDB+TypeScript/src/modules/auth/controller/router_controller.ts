import { Request, Response } from "express";
import {MongoClient } from "mongodb";
import bcrypt from 'bcrypt'
import User from '../model/User'
import jwt from 'jsonwebtoken'
import 'dotenv/config'


const saltRound =  10


export  class AuthController{
    private client: MongoClient
    private db
    private users

    constructor(){
        const uri = 'mongodb://0.0.0.0:2717/?authMechanism=DEFAULT'
        this.client = new MongoClient(uri)
        this.db = this.client.db('socialapp')
        this.users = this.db.collection<User>('users')
    }


    public signup = async (req : Request,res: Response ) =>{


        const {name,email,password} = req.body
        const hash = await bcrypt.hash(password,saltRound)
        
        
        const user: User = { name: name, email: email, password: hash }
        
        const foundEmail = await this.users.findOne<User>({email})

        if(foundEmail){
            return res.status(409).json({error: 'Já existe um usuário com este email'})
        }
            
            const result = await this.users.insertOne(user)
            return res.status(200).json(result)
        
    }


        public signin = async(req: Request, res: Response) => {
            const {email,password} = req.body

            const hash = await bcrypt.hash(password,saltRound)
           
            const foundUser = await this.users.findOne<User>({
                email: email
            })
            const checkPassword = await bcrypt.compare(hash,foundUser!.password)
         
            if(!foundUser && !checkPassword){
                return res.status(401).json({error: "Usuario e/ou senha incorretos"})
            }
            try{
                const secret = process.env.SECRET
                const token = jwt.sign({id: foundUser?.id},secret!,{expiresIn: "1m"})
                res.status(400).json({refreshtoken: token, auth: true})
            }catch(err){
                console.log(err);
                res.status(500).json({msg: err})
            }
        }
    }

    


