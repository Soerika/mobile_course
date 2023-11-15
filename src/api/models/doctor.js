const mongoose = require('mongoose');

const doctorSchema = new mongoose.Schema({
    firstName: {
        type: String,
        required: true,
    },
    lastName: {
        type: String,
        required: true,
    },
    specialization: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        default: '',
    },
    rating: {
        type: Number,
        default: 5,
    },
});

module.exports = mongoose.model('Doctor', doctorSchema);