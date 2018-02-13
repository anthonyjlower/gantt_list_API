class ProjectController < ApplicationController

	# Get all tasks for a project
	get "/:id/tasks" do
		@project = Project.find params[:id]
		@projTasks = @project.tasks
		@projTasks.to_json
	end

	post "/" do
		@project = Project.new
		@project.content = params[:name]
		@project.start = params[:startdate]
		@project.end = params[:enddate]
		@project.completed = params[:completed]
		@project.user_id = params[:user_id]
		@project.save
		resp = {
			status: {
				success: true,
				message: "New project created for user #{@project.user_id}"
			},
			project: @project
		}
		resp.to_json
	end


	put "/:id" do
		@project = Project.find params[:id]
		@project.content = params[:name]
		@project.start = params[:startdate]
		@project.end = params[:enddate]
		@project.completed = params[:completed]
		@project.user_id = params[:user_id]
		@project.save
		resp = {
			status: {
				success: true,
				message: "Successfully update project #{@project.name}"
			},
			project: @project
		}
		resp.to_json
	end



	delete "/:id" do
		@project = Project.find params[:id]
		@project.delete
		@project = Project.all
		resp = {
			status: {
				success: true,
				message: "Project #{@project.id} has been deleted, this is all of the remaining projects"
			},
			project: @projects
		}
		resp.to_json
	end

end