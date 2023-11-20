const express = require('express');
const router = express.Router();

const appointmentController = require('../controllers/appointmentController');
const { authenticateToken } = require('../middlewares/authenticate');

/**
 * @swagger
 * /appointments/search:
 *   get:
 *     summary: search for appointments
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
router.get('/search', authenticateToken, appointmentController.search);

/**
 * @swagger
 * /appointments/:id:
 *   get:
 *     summary: look up all appointment base on user id
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.get('/:id', appointmentController.index);

/**
 * @swagger
 * /appointments:
 *    post:
 *     summary: create an appointment
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.post('/:id', appointmentController.post);

/**
 * @swagger
 * /appointments/:id:
 *    put:
 *     summary: cancelled an appointment
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.put('/:id', appointmentController.put);

module.exports = router