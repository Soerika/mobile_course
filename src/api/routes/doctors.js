const express = require('express');
const router = express.Router();

const doctorController = require('../controllers/doctorController');

/**
 * @swagger
 * /doctors/search:
 *    get:
 */
router.get('/search', doctorController.search);

/**
 * @swagger
 * /doctors/:id:
 *    get:
 */
router.get('/:id', doctorController.show);

/**
 * @swagger
 * /doctors/:
 *    get:
 */
router.get('/', doctorController.index);

module.exports = router