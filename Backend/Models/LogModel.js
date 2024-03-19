const mongoose = require('mongoose')

const LogSchema = mongoose.Schema({
    action: {
        type: String,
        required: true,
    },
    taken_by: {
        type: String,
        required: true,
    },
    taken_on: {
        type: String,
    },
    timestamp: {
        type: Date,
        require: true
    }
})

module.exports = mongoose.model('Logs', LogSchema)