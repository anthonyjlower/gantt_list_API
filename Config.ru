require "sinatra/base"
require "sinatra/activerecord"



# Controllers
require "./controllers/ApplicationController"
require "./controllers/UserController"
require "./controllers/ProjectController"


# Models
require "./models/ProjectModel"
require "./models/UserModel"
require "./models/TaskModel"


# Mapping
map ("/") {
	run ApplicationController
}
map ('/users') {
	run UserController
}
map ('/projects') {
	run ProjectController
}
