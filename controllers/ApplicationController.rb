class ApplicationController < Sinatra::Base

	require "bundler"
	Bundler.require();
	require './config/environments'
	
	enable :sessions
	set :views, File.expand_path("../../views", __FILE__)
	set :public_dir, File.expand_path("../../public", __FILE__)
	
	register Sinatra::CrossOrigin

	use Rack::MethodOverride  # we "use" middleware in Rack-based libraries/frameworks
	set :method_override, true

	
	configure do
		enable :cross_origin
	end

	set :allow_origin, :any
	set :allow_methods, [:get, :post, :options, :put, :delete]
	set :allow_credentials, true


	get "/" do
		redirect "/login"
	end

	get "/login" do
		erb :login
	end

	get "/register" do
		erb :register
	end



	options "*" do
		response.headers["Allow"] = "HEAD, GET, PUT, POST, DELETE, OPTIONS"
		response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
	end


end