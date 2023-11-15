const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const reviewSchema = new mongoose.Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    doctorId: {
        type: Schema.Types.ObjectId,
        ref: 'Doctor'
    },
    isAnonymous: {
        type: Boolean,
        default: false,
    },
    reviewText: {
        type: String,
        maxLength: 2000,
    },
});

module.exports = mongoose.model('Review', reviewSchema);