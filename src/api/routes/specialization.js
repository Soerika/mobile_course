const express = require('express');
const router = express.Router();

const specializationController = require('../controllers/specializationController');

router.get('/:slug', specializationController.get);


router.get('/', specializationController.index);

module.exports = router