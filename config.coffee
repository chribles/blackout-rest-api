exports.config =

	# See http://brunch.readthedocs.org/en/latest/config.html for documentation.
	files:
		javascripts:
			defaultExtension: 'coffee'
			joinTo:
				'javascripts/app.js': /^app/									
				'javascripts/vendor.js': /^(bower_components|vendor)/
			
	
	# See http://brunch.readthedocs.org/en/latest/config.html for documentation.
	server:
		path: 'server.coffee'
		port: 5000
