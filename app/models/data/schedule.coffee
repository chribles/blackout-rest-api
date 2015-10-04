mongoose = require 'mongoose'
shortId = require 'shortid'
Schema = mongoose.Schema

attributes =
	_id:
		type: String				
		unique: true		
		default: shortId.generate	
	day: 
		type: String
		index: true
	start:
		hour: Number
		minute: Number
	end:
		hour: Number
		minute: Number
	
	
schema = new Schema attributes, strict: true

model = mongoose.model 'Schedule', schema

module.exports = model