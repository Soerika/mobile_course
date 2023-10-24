const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const officeAvailabilitySchema = new Schema({
    officeId: {
        type: Schema.Types.ObjectId,
        ref: 'Office',
    },
    
});

module.exports = mongoose.model('OfficeAvailability', appoinmentSchema);