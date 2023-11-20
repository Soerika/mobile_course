const mongoose = require('mongoose');

const doctorSchema = new mongoose.Schema({
    email: {
        type: String,
        required: true,
    },
    password: {
        type: String,
        required: true,
    },
    gender: {
        type: Boolean,
        required: true,
    },
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
    icon: {
        
    }
});

module.exports = mongoose.model('Doctor', doctorSchema);