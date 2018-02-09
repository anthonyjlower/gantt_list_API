# gantt_list_API
The backend for a Gantt List Product Management App

Built with Sinatra and uses ActiveRecord to interact with a PSQL database.


# Routes

### Users can view all of their projects
GET /users/:user_id/projects

### Users can create new projects
POST /projects/

### Users can edit existing projects - Including marking them as complete
PUT /projects/:project_id

### User can delete existing projects
DELETE /projects/:projects_id


## Within Projects User can

### View all of the tasks within a project

### Can create new tasks for a project - Including marking them as complete

### Can edit exisiting tasks for a project

### Can Delete exisiting tasks for a project

