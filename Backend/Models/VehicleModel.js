const mongoose = require('mongoose');

const VehicleSchema = new mongoose.Schema({
    _id: {
        type: String,
        required: true,
    },
    vendor: {
        type: String,
        required: true
    },
    name: {
        type: String,
        required: true
    },
    seats: {
        type: Number,
        required: true
    },
    location: {
        type: [Number]
    }
});

module.exports = mongoose.model('Vehicles', VehicleSchema);