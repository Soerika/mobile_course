const express = require('express');

const publicController = require('../controllers/publicController');
const router = express.Router();


/**
 * @swagger
 * /public/icons/:slug:
 *   get:
 *     summary: get specialization icon
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.get('/icons/:slug', publicController.icon);

module.exports = router;