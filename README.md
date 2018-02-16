# gantt_list_API

[Contributions by: Travis Clark](https://github.com/Travis1282)


The backend for Product Management App

Built with Sinatra and uses ActiveRecord to interact with a PSQL database.

This API allows you to create, edit, and delete users, projects, and tasks that are stored in a SQL database to be rendered in a project management app.

The Users are set up to have projects that belong to them, and then the projects have tasks that belong to them. The table sections includes all of the required information that should be sent to the database.

The parameters must be sent as form-urlencoded


## Tables

### Users
username and encrypted password

### Projects
Project name, start date, end date, completed boolean, user_id that it belongs to

### Tasks
Task name, start date, end date, completed boolean, belongs_to (establishes relationship to other tasks it is reliant on), project_id that it belongs to


# Routes

### GET / 
redirects to login page

### GET /login
Renders login template

### GET /register
Renders new user registration template

### POST /users/
Creates a new user in the database
• If successful it redirects to the react app
• If unsuccessful it goes back to the registration template with an error message

### POST /users/login
Finds the user logging in in the database
• If successful it redirects to the react app
• If unsuccessful it goes back to the login template with an error message

### GET /users/projects
Finds all of the logged in users projects in the database
Returns a JSON response with the number of projects, a array of all the projects, and the user_id


### GET /projects/:project_id/tasks
Finds all of the tasks that belong to a selected project
Returns a JSON response with number of tasks and an array of all of the tasks

### POST /projects/
Creates a new project for the logged in user.
Returns a JSON response all of the projects that belong to the user

### PUT /projects/project_id/
Edits the information for a selected project
Returns a JSON response of all of the user's projects

### DELETE /projects/project_id/
Destroys a selected project, and all of that projects tasks from the the Database
Returns a JSON response containing all of the user's projects

### POST /tasks/
Creates a new task that belongs to the project ID it receives
Returns a JSON response of all of the tasks that belong to that project

### PUT /tasks/task_id
Edits the task that belongs to the ID in the URL
Returns a JSON response of all of the project's tasks

### DELETE /tasks/task_id
Deletes the task that belongs to the ID in the url
Returns a JSON response of all of the project's tasks

