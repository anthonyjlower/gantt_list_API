# gantt_list_API
The backend for a Gantt List Product Management App

Built with Sinatra and uses ActiveRecord to interact with a PSQL database.


# Routes

### View all users in the app
GET /users/

### Create new user
POST /users/

### Edit exisiting user
PUT /users/:user_id

### Delete exisiting user
DELETE /users/:user_id


### Users can view all of their projects
GET /users/:user_id/projects

### Users can create new projects
POST /projects/

### Users can edit existing projects - Including marking them as complete
PUT /projects/:project_id

### User can delete existing projects
DELETE /projects/:project_id


# Within Projects User can

### View all of the tasks within a project
GET /projects/:project_id/tasks

### Can create new tasks for a project
POST /tasks/

### Can edit exisiting tasks for a project - Including marking them as complete
PUT /tasks/:task_id

### Can Delete exisiting tasks for a project
DELETE /tasks/:task_id

