class TaskController < ApplicationController

	post "/" do
		@task = Task.new
		@task.content = params[:content]
		@task.start = params[:start]
		@task.end = params[:end]
		@task.completed = params[:completed]
		@task.belongs_to = params[:belongs_to]
		@task.project_id = params[:project_id]
		@task.save

		@project = Project.find params[:project_id]
		@projTasks = @project.tasks
		resp = {
			status: {
				success: true,
				message: "New task created for project #{@task.project_id}"
			},
			projTasks: @projTasks
		}
		resp.to_json
	end

	put "/:id" do
		@task = Task.find params[:id]
		@task.content = params[:content]
		@task.start = params[:start]
		@task.end = params[:end]
		@task.completed = params[:completed]
		@task.belongs_to = params[:belongs_to]
		@task.project_id = params[:project_id]
		@task.save

		@project = Project.find params[:project_id]
		@projTasks = @project.tasks
		
		resp = {
			status: {
				success: true,
				message: "All of the tasks for project #{@project.id}"
			},
			projTasks: @projTasks
		}
		resp.to_json
	end

	delete "/:id" do
		@task = Task.find params[:id]
		@project = Project.find @task.project_id
		@task.delete
		@tasks = @project.tasks
		resp = {
			status: {
				success: true,
				message: "task #{@task.id} has been deleted, this is all of the remaining tasks"
			},
			tasks: @tasks
		}
		resp.to_json
	end

end