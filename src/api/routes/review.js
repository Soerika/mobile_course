const express = require('express');
const router = express.Router();

const reviewController = require('../controllers/reviewController');

/**
 * @swagger
 * /review/:id:
 *    get:
 */
router.get('/:id', reviewController.show);

/**
 * @swagger
 * /review/:id:
 *    post:
 */
router.post('/:id', reviewController.review);

/**
 * @swagger
 * /review/:
 *    get:
 */
router.get('/', reviewController.index);

module.exports = router