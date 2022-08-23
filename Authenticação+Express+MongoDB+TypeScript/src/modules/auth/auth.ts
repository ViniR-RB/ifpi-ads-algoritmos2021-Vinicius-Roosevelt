import { Router } from "express";
import {AuthController} from "./controller/router_controller";



const router = Router()
const authController  =  new AuthController()



router.post('/signup',authController.signup);



router.post('/signin',authController.signin);


router.post('/me', (req,res) => {
    res.status(200).json({msg: "Minhas Coisas"})
})


export default router