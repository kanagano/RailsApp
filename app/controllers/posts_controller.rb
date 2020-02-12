class PostsController < ApplicationController
	before_action :authenticate_user, {only: [:upload, :create]}

	def index
		@users = User.all
		@posts = Post.all
	end
	def upload 
		@post = Post.new
	end
	def create
		@post = Post.new(
			name: params[:name],
			price: params[:price],
			period: params[:period],
			user_id: @current_user.id
		)
		if @post.save
			redirect_to("/posts/index")
		else
			render("posts/upload")
		end
	end
end
