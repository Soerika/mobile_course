const express = require('express');
const router = express.Router();

const publicController = require('../controllers/publicController');
const upload = require('../middlewares/upload');


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

/**
 * @swagger
 * /public/avatar/:id:
 *   get:
 *     summary: get avatar
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.get('/avatars/:id', publicController.avatar);

/**
 * @swagger
 * /public/avatar/:id:
 *   put:
 *     summary: update avatar
 *     responses:
 *       200:
 *         content:
 *           application/json:
 */
router.put('/avatars/:id', upload.single('image'), publicController.updateAvatar);

module.exports = router;