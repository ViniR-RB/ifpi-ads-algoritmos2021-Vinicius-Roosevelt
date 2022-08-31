import { MongoClient } from "mongodb";
import {Request,Response} from 'express'
import Feed from '../model/feed'
export class FeedController{
    private cliente: MongoClient
    private db
    private feed
    constructor(){
        const uri = 'mongodb://0.0.0.0:2717/?authMechanism=DEFAULT'
        this.cliente = new MongoClient(uri)
        this.db = this.cliente.db('socialapp')
        this.feed = this.db.collection<Feed>('feed')
    }

    public enviarPubli = async (req: Request,res:Response) =>{
        const {body} = req.body
        const feed : Feed = {body: body}
        

        try{
            const insertfeed  = await this.feed.insertOne(feed)
            return res.status(200).json(insertfeed)

        }catch(err){
            res.status(401).json({msg: "Não foi possível criar o feed"})
        }

    }
    public mostrarFeed = async (req: Request, res: Response) => {
        const {body} = req.body
        const find = await this.feed.findOne<Feed>({
            body
        });
        
        
    
        return res.status(200).json({body: find?.body })
    }
}