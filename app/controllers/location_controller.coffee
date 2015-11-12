Location = require "../models/data/location"

exports.get = (req, res, next) ->
	Location.findOne
		_id: req.params.id
	, (err, schedule) ->
		unless err			
			res.json schedule
		else
			next err

exports.list = (req, res, next) ->
	skip = req.query.skip || 0
	limit = req.query.take || 20
	search = req.query.search 
	
	options = { $or: [{ "name": { $regex : new RegExp(search, "i") } }, { "region": { $regex : new RegExp(search, "i") } }] } 
	options = {}  if (typeof(search) == "undefined") 
	
	query = Location.find(options)		
		.limit limit
		.skip skip
		.sort "name"
		.exec (err, results) ->
			unless err
				now = new Date()				
				schedules = 
					query:
						count: results.length
						created: now
						lang: "en-GB"
						results:
							place: results

				res.json schedules
			else
				next err		