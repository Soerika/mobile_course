const express = require('express');
const router = express.Router();

const userAuthController = require('../controllers/userAuthController');

/**
 * @swagger
 * /users/:
 *    POST:
 */
router.post('/login', userAuthController.login);

/**
 * @swagger
 * /users/:
 *    POST:
 */
router.post('/refresh', userAuthController.refresh);

module.exports = router
