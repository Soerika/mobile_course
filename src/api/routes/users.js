const express = require('express');
const router = express.Router();

const userController = require('../controllers/userController');
const { authenticateToken } = require('../middlewares/authenticate');

/**
 * @swagger
 * /user/search:
 *    get:
 *     summary: search for users
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *     responses:
 *       200:
 *         content:
 *           application/json:
 *             schema:
 */
router.get('/search', authenticateToken, userController.search);

/**
 * @swagger
 * /user/:id:
 *    get:
 *     summary: get a user
 *     responses:
 *       200:
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Book'
 */
router.get('/:id', authenticateToken, userController.show);

/**
 * @swagger
 * /users:
 *    get:
 *     summary: get all users
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.get('/', authenticateToken, userController.index);

module.exports = router