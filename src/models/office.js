const mongoose = require('mongoose');

const officeSchema = new mongoose.Schema({
    hospitalName: {
        type: String,
        required: true,
    },
    consultationFee: {
        type: Number,
        required: true,
        default: 200,
    },
});

module.exports = mongoose.model('Appointment', appoinmentSchema);