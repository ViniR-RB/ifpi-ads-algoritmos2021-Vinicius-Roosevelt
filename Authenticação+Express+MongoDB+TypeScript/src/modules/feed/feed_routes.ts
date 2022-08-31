import { Router} from 'express'
import { FeedController } from './controller/feed_controller'
import checkToken from '../../middlewares/check_token'

const router = Router()

const feedController = new FeedController()

router.post('/mostraFeed',checkToken, feedController.mostrarFeed)
router.post('/enviarPubli', checkToken, feedController.enviarPubli)


export default router