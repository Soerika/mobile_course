const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const appoinmentSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    startTime: {
        type: Date,
    },
    endTime: {
        type: Date,
    },
    status: {
        type: String,
        enum: ['pending', 'booked', 'canceled'],
        default: 'booked',
    },
});

module.exports = mongoose.model('Appointment', appoinmentSchema);
