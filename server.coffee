# require('coffee-script')
express = require 'express'
fs = require 'fs'
mongoose = require 'mongoose'
path = require 'path'
flash = require 'connect-flash'
db_access = require './private/db/auth'
config = require './config'
app = module.exports = express()


PORT = process.env.PORT or config.config.server.port or 5000
MONGODB_URI = "#{db_access.auth.host}#{db_access.auth.name}"

# Configuration
app.set 'storage-uri', process.env.MONGOHQ_URL or process.env.MONGOLAB_URI or MONGODB_URI
app.all '/*', (req, res, next) ->	
	res.header 'Access-Control-Allow-Origin', '*'
	res.header 'Access-Control-Allow-Headers', 'X-Requested-With,content-type'	
	next()

# Setup the MongoDB connection
mongoose.connect app.get('storage-uri'), { db: {safe: true} }, (err) ->
	unless err
		console.log "Mongoose - connection OK"
	else
		console.log "Mongoose - connection error: #{err}"

models_dir = __dirname + "/app/models/data"
fs.readdirSync(models_dir).forEach (file) ->
	return  if file[0] is "."
	require models_dir + "/" + file


# Routes
require('./private/routes/api')(app)

app.startServer =  ->
	app.listen PORT, ->
		console.log "Express server listening on port %d in %s mode", PORT, app.settings.env