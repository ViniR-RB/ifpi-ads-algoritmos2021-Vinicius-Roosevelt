import { Router } from 'express'
import authRoutes from '../auth/auth'
import feedRoutes from '../feed/feed_routes'

const router = Router()



router.use('/auth', authRoutes)
router.use('/feed', feedRoutes)

export default router