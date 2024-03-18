const mongoose = require('mongoose');

const AuthSchema = new mongoose.Schema({
	username: {
		type: String,
		required: true,
		unique: true,
		index: true
	},
	password: {
		type: String,
		required: true,
	}
});

module.exports = mongoose.model('Auth', AuthSchema);