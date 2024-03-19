const mongoose = require('mongoose');

const RouteSchema = new mongoose.Schema({
    _id: {
        type: String,
        required: true
    },
    shift: {
        type: Date,
        required: true
    },
    d_id: {
        type: String,
        ref: 'Users'
    },
    employees: {
        id: {
            type: String,
            ref: 'Users',
            required: true,
        },
        eta: {
            type: String,
            required: true,
        },
        status: {
            type: String,
        },
        required: true,
    },
    v_id: {
        type: String,
        ref: 'Vehicles'
    },
    status: {
        type: Boolean,
        required: true,
    },
}, {timestamps: true})

module.exports = mongoose.model('Routes', RouteSchema)