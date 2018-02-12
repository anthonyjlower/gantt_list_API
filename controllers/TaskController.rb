class TaskController < ApplicationController

	post "/" do
		@task = Task.new
		@task.name = params[:name]
		@task.startdate = params[:startdate]
		@task.enddate = params[:enddate]
		@task.completed = params[:completed]
		@task.belongs_to = params[:belongs_to]
		@task.project_id = params[:project_id]
		@task.save
		resp = {
			status: {
				success: true,
				message: "New task created for user #{@task.user_id}"
			},
			task: @task
		}
		resp.to_json
	end

	put "/:id" do
		@task = Task.find params[:id]
		@task.name = params[:name]
		@task.startdate = params[:startdate]
		@task.enddate = params[:enddate]
		@task.completed = params[:completed]
		@task.belongs_to = params[:belongs_to]
		@task.project_id = params[:project_id]
		@task.save
		resp = {
			status: {
				success: true,
				message: "Successfully update task #{@task.name}"
			},
			task: @task
		}
		resp.to_json
	end

	delete "/:id" do
		@task = task.find params[:id]
		@task.delete
		@task = task.all
		resp = {
			status: {
				success: true,
				message: "task #{@task.id} has been deleted, this is all of the remaining tasks"
			},
			task: @tasks
		}
		resp.to_json
	end

end