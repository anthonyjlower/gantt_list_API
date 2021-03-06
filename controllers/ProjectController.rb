class ProjectController < ApplicationController

	# Get all tasks for a project
	get "/:id/tasks" do
		@project = Project.find params[:id]
		@projTasks = @project.tasks

		resp = {
			status: {
				success: true,
				message: "Here are the tasks for project #{@project.id}",
				number_of_tasks: @projTasks.length	
			},
			tasks: @projTasks
		}
		resp.to_json
	end

	post "/" do
		@project = Project.new
		@project.content = params[:content]
		@project.start = params[:start]
		@project.end = params[:end]
		@project.completed = params[:completed]
		@project.user_id = params[:user_id]
		@project.save

		@user = User.find params[:user_id]
		@userProjs = @user.projects

		resp = {
			status: {
				success: true,
				message: "New project created for user #{@project.user_id}"
			},
			projects: @userProjs
		}
		resp.to_json
	end


	put "/:id" do
		@project = Project.find params[:id]
		@project.content = params[:content]
		@project.start = params[:start]
		@project.end = params[:end]
		@project.completed = params[:completed]
		@project.user_id = params[:user_id]
		@project.save

		@user = User.find params[:user_id]
		@userProjs = @user.projects

		resp = {
			status: {
				success: true,
				message: "Successfully update project #{@project.content}"
			},
			projects: @userProjs
		}
		resp.to_json
	end

	delete "/:id" do
		@project = Project.find params[:id]
		@user = User.find @project.user_id
		@project.destroy
		
		
		@userProjs = @user.projects

		resp = {
			status: {
				success: true,
				message: "The project has been deleted, this is all of the remaining projects"
			},
			projects: @userProjs
		}
		resp.to_json
	end

end