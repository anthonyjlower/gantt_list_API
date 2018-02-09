class UserController < ApplicationController

	get "/" do
		@users = User.all
		resp = {
			status: {
				success: true,
				message: "These are all of the users in the database",
				number_of_results: @users.length
			},
			users: @users
		}
		resp.to_json
	end

	# Get all projects for a user
	get "/:id/projects" do
		@users = User.find params[:id]
		@userProjs = @users.projects
		@userProjs.to_json
	end



	post "/" do
		@user = User.new
		@user.name = params[:name]
		@user.permission = params[:permission]
		@user.save
		resp = {
			status: {
				success: true,
				message: "Account created for #{@user.name}"
			},
			user: @user
		}
		resp.to_json
	end


	put "/:id" do
		@user = User.find params[:id]
		@user.name = params[:name]
		@user.permission = params[:permission]
		@user.save
		resp = {
			status: {
				success: true,
				message: "Account udpated for #{@user.name}"
			},
			user: @user
		}
		resp.to_json
	end



	delete "/:id" do
		@user = User.find params[:id]
		@user.delete
		@users = User.all
		resp = {
			status: {
				success: true,
				message: "Account has been deleted, this is all of the remaining users"
			},
			users: @users
		}
		resp.to_json
	end

end