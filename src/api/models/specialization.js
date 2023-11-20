const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const specializationSchema = new mongoose.Schema({
    icon: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        maxLength: 2000,
    }
});

module.exports = mongoose.model('Specialization', specializationSchema);