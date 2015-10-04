mongoose = require 'mongoose'
shortId = require 'shortid'
Schema = mongoose.Schema

scheduleSchema =
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

attributes =
	_id:
		type: String
		unique: true		
		default: shortId.generate
	name:
		type: String		
		index: true
	region:
		type:String
		index: true
	code: String
	schedules: [scheduleSchema]


schema = new Schema attributes, strict: true, collection: 'schedules'

model = mongoose.model 'Location', schema

module.exports = model