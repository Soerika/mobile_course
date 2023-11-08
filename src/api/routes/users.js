const express = require('express');
const router = express.Router();

const userController = require('../controllers/userController');

/**
 * @swagger
 * /users/search:
 *    get:
 *      description: Returns all users
 */
router.get('/search', userController.search);

/**
 * @swagger
 * /users/:id:
 *    get:
 *      description:
 */
router.get('/:id', userController.show);

/**
 * @swagger
 * /users/:
 *    get:
 */
router.get('/', userController.index);

module.exports = router