const express = require('express');
const router = express.Router();

const appointmentController = require('../controllers/appointmentController');

/**
 * @swagger
 * /appointments/search:
 *    get:
 */
router.get('/search', appointmentController.search);

/**
 * @swagger
 * /appointments/:id:
 *    get:
 */
router.get('/:id', appointmentController.index);

/**
 * @swagger
 * /appointments/:
 *    get:
 */
// router.get('/', appointmentController.index);

/**
 * @swagger
 * /appointments/:id:
 *    post:
 */
router.post('/:id', appointmentController.post);

/**
 * @swagger
 * /appointments/:
 *    put:
 */
router.put('/:id', appointmentController.put);

module.exports = router