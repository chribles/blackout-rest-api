locationController = require "../../app/controllers/location_controller"

module.exports = (app) ->
	
	# API
	app.get "/api/schedules", locationController.list

	app.get "/api/schedules/:id", locationController.get