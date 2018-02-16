class UserController < ApplicationController

	# Get all projects for a user -- User Homepage
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
			projects: @userProjs,
			user_id: @user.id
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
			@newUser.save
			resp = {
				status: {
					success: true,
					message: "Account created for #{@newUser.username}"
				},
				user: @newUser
			}
			session[:message] = ""
			session[:user_id] = @newUser.id
			redirect 'https://secure-sea-57677.herokuapp.com/'
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
			session[:message] = ""
			session[:user_id] = @user.id
			redirect 'https://secure-sea-57677.herokuapp.com/'
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

end