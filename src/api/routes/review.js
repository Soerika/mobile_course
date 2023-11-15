const express = require('express');
const router = express.Router();

const reviewController = require('../controllers/reviewController');

router.get('/:id', reviewController.show);

router.post('/:id', reviewController.review);

router.get('/', reviewController.index);

module.exports = router