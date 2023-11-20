const express = require('express');
const router = express.Router();

const userAuthController = require('../controllers/userAuthController');

const {authenticateToken} = require('../middlewares/authenticate');

/**
 * @swagger
 * /authentication/login:
 *    post:
 *     summary: login
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.post('/login', userAuthController.login);

/**
 * @swagger
 * /authentication/signup:
 *    post:
 *     summary: sign up
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.post('/signup', userAuthController.signup);

/**
 * @swagger
 * /authentication/refresh:
 *    post:
 *     summary: refresh token
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.post('/refresh', authenticateToken, userAuthController.refresh);

module.exports = router
