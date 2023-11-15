const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const appoinmentSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    doctorId: {
        type: Schema.Types.ObjectId,
        ref: 'Doctor'
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
    fee: {
        type: Number,
        require: true,
        default: 200,
    }
});

module.exports = mongoose.model('Appointment', appoinmentSchema);
