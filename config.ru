require "sinatra/base"
require "sinatra/activerecord"



# Controllers
require "./controllers/ApplicationController"
require "./controllers/UserController"
require "./controllers/ProjectController"
require "./controllers/TaskController"


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
map ('/tasks') {
    run TaskController
}