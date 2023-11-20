const express = require('express');

const publicController = require('../controllers/publicController');
const router = express.Router();

router.get('/icons/:slug', publicController.icon);

module.exports = router;