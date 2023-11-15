const express = require('express');
const router = express.Router();

const userAuthController = require('../controllers/userAuthController');

const {authenticateToken} = require('../middlewares/authenticate');

/**
 * @swagger
 * /authentication/login:
 *    POST:
 */
router.post('/login', userAuthController.login);

/**
 * @swagger
 * /authentication/login:
 *    POST:
 */
router.post('/signup', userAuthController.signup);

/**
 * @swagger
 * /authentication/refresh:
 *    POST:
 */
router.post('/refresh', authenticateToken, userAuthController.refresh);

module.exports = router
