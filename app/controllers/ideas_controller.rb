class IdeasController < ApplicationController
	before_filter :authorize

# every route in this controller MUST belong to a user!
# a user must be loaded before every action

before_action do 
	@user = User.find(params[:user_id])
	# if not allowed, redirect with error message
end

# before_action :set_idea, only: [:show, :update, :edit, :destroy]

	def index
		# if current_user.admin?
			# @ideas = Idea.all
		# elsif current_user
		if current_user.nil? || current_user.id != params[:user_id]
			flash[:dumbass] = "You are not authorized to access this page"
			redirect_to login_path 
		else
			@ideas = @user.ideas
		end
	end

	def authorize
	if current_user.nil?   		#if not signed_in?
		flash[:alert] = "Not authorized"
		redirect_to login_path
 	end
 end

	# 	def show
	# 	@user = User.find(params[:id])
	# 	if current_user.admin?
	# 		render :show
	# 	elsif current_user.id != params[:id].to_i
	# 		flash[:dumbass] = "You are not authorized to access this page"
	# 		redirect_to login_path
	# 	else
	# 		render :show
	# 	#new view in sessions bc i'm going to the login_path
	# 	end
	# end

	# def index
	# 	if current_user.id == @user.id || current_user.admin?
	# 		@ideas = @user.ideas
	# 	else
	# 		redirect_to root_path, flash[:dumbass] = "You are not authorized to access this page"
	# 	end
	# end

	def show
		@idea = Idea.find(params[:id])
	end

	def edit
		@idea = Idea.find(params[:id])
	end

	def new
		@idea = @user.ideas.build
	end

	def create
		@idea = @user.ideas.build(idea_params)

		if @idea.save
			redirect_to user_ideas_path(@user)
		else
			render :new
		end
	end

	def update
		@idea = Idea.find(params[:id])
		if @idea.update(idea_params)
			redirect_to user_ideas_path(user_id: @user.id)
		else
			render :edit
		end		
	end

	def destroy
		@idea = Idea.find(params[:id])
		@idea.destroy
		redirect_to user_ideas_path
	end

	private
 	def idea_params
	  params.require(:idea).permit(:name, :body, :user_id)
  end

end
