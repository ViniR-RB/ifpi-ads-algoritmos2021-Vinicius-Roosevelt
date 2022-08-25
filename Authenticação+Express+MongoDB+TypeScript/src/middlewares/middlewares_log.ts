import {NextFunction, Request, Response} from 'express'



export const LogMiddleware = (req: Request, res: Response, next: NextFunction) => {
    const meth = req.method
    console.log(`LOG; ${Date.now()} \n - Route: localhost:3000${req.originalUrl}`)
    return next();
}