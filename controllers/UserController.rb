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
	get "/projects" do
		p session
		p '---------------------------------------'
		s = session 
		p s 
		p '---------------------------------------'
		@user = User.find session["user_id"]
		@userProjs = @user.projects
		resp = {
			status: {
				success: true,
				message: "These are the projects for #{@user.username}",
				number_of_projects: @userProjs.length
			},
			projects: @userProjs
		}
		resp.to_json
	end

	# Creates a new users from the register page
	post "/" do
		# Look to see if that user name exists alrady
		@user = User.find_by(username: params[:username])

		if @user
			session[:message] = "That username is taken, please select another"
			redirect '/register'
		else
			@newUser = User.new
			@newUser.username = params[:username]
			@newUser.password = params[:password]
			@user.save
			resp = {
				status: {
					success: true,
					message: "Account created for #{@user.username}"
				},
				user: @newUser
			}
			redirect 'http://localhost:3000'
		end
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
			session[:user_id] = @user.id
			redirect 'http://localhost:3000'
		else
			resp = {
				status: {
					completed: false,
					message: "User login failed"
				}
			}
			session[:message] = "The username and/or the password is incorrect, please try again"
			redirect '/login'
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