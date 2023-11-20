const express = require('express');
const router = express.Router();

const reviewController = require('../controllers/reviewController');

/**
 * @swagger
 * /review/:id:
 *   get:
 *     summary: get a review
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.get('/:id', reviewController.show);


/**
 * @swagger
 * /review:
 *    get:
 *     summary: get all review
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.get('/', reviewController.index);

/**
 * @swagger
 * /review/:id:
 *    post:
 *     summary: create a review
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
router.post('/:id', reviewController.review);



module.exports = router