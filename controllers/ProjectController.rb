class ProjectController < ApplicationController

	post "/" do
		@project = Project.new
		@project.name = params[:name]
		@project.startdate = params[:startdate]
		@project.enddate = params[:enddate]
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
		@project.name = params[:name]
		@project.startdate = params[:startdate]
		@project.enddate = params[:enddate]
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