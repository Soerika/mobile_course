const express = require('express');
const router = express.Router();

const doctorController = require('../controllers/doctorController');

/**
 * @swagger
 * /doctors/search:
 *   get:
 *     summary: seach for a doctor
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
router.get('/search', doctorController.search);

/**
 * @swagger
 * /doctors/:id:
 *   get:
 *     summary: get a doctor info
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.get('/:id', doctorController.show);

/**
 * @swagger
 * /doctors:
 *   get:
 *     summary: get all doctor
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.get('/', doctorController.index);

module.exports = router