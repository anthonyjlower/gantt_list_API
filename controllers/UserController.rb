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

	# Creates a new users from the register page
	post "/" do
		@user = User.new
		@user.username = params[:username]
		@user.password = params[:password]
		@user.save
		resp = {
			status: {
				success: true,
				message: "Account created for #{@user.username}"
			},
			user: @user
		}
		resp.to_json
	end


	# Route that runs when a user tries to login
	post "/login" do
		@pw = params[:password]
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(@pw)
			resp = {
				status: {
					completed: true,
					message: "#{@user.username} is logged in"
				},
				user: @user
			}
			redirect_to 'http://localhost:3000'
			# resp.to_json
		else
			resp = {
				status: {
					completed: false,
					message: "User login failed"
				}
			}
			resp.to_json
		end
	end

	put "/:id" do
		@user = User.find params[:id]
		@user.name = params[:name]
		@user.permission = params[:permission]
		@user.save
		resp = {
			status: {
				success: true,
				message: "Account udpated for #{@user.username}"
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