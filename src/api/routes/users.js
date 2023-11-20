const express = require('express');
const router = express.Router();

const userController = require('../controllers/userController');
const { authenticateToken } = require('../middlewares/authenticate');

/**
 * @swagger
 * /users/search:
 *    get:
 *      description: Returns all users
 */
router.get('/search', authenticateToken, userController.search);

/**
 * @swagger
 * /users/:id:
 *    get:
 *      description:
 */
router.get('/:id', authenticateToken, userController.show);

/**
 * @swagger
 * /users/:
 *    get:
 */
router.get('/', authenticateToken, userController.index);

module.exports = router