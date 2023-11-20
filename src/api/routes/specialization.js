const express = require('express');
const router = express.Router();

const specializationController = require('../controllers/specializationController');

router.get('/:slug', specializationController.get);

/**
 * @swagger
 * /specialization:
 *    get:
 *     summary: get all specialization
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.get('/', specializationController.index);

/**
 * @swagger
 * /specialization/:slug:
 *    get:
 *     summary: get a specialization
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.get('/', specializationController.get);

module.exports = router