class UsersController < ApplicationController
	before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

	def index
		@users = User.all
	end
	def show
		@user = User.find_by(id: params[:id])
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(
			name: params[:name],
			place: params[:place],
			email: params[:email],
			password: params[:password]
		)
		if @user.save
			session[:user_id] = @user.id
			redirect_to("/users/index")
		else
			render("users/new")
		end
	end
	def login_form
	end
	def login
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to("/posts/index")
		else
			@email = params[:email]
			@password = params[:password]
			render("users/login_form")
		end
	end
	def logout
		session[:user_id] = nil
		redirect_to("/login")
	end
end
