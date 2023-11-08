const express = require('express');
const router = express.Router();

const userAuthController = require('../controllers/userAuthController');

const authenticateMiddleware = require('../middlewares/authenticate');

/**
 * @swagger
 * /authentication/login:
 *    POST:
 */
router.post('/login', userAuthController.login);

/**
 * @swagger
 * /authentication/refresh:
 *    POST:
 */
// router.post('/refresh', authenticateMiddleware.authenticateToken, userAuthController.refresh);

module.exports = router
