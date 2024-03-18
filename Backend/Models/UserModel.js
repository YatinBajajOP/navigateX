const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
	_id: {
		type: String,
		required: true,
	},
	address: {
		type: String,
		required: true,
	},
	location: {
		type: [Number],
		required: true,
	},
	name: {
		type: String,
		required: true,
	},
	phn: {
		type: Number,
	},
	role: {
		type: String,
		required: true,
	}
}, { timestamps: true });

module.exports = mongoose.model('Users', UserSchema);