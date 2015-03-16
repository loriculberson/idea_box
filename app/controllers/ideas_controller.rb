class IdeasController < ApplicationController
  before_filter :authorize

	def index
		if current_user.admin?
			@ideas = Idea.all 
		else
			@ideas = current_user.ideas
		end
	end

	def show
		if current_user.admin?
			@idea = Idea.find(params[:id])
		else
			@idea = current_user.ideas.find(params[:id])
		end
		#Idea.where(user_id: current_user.id, id: params[:id]).first
	end

	def edit
		@idea = Idea.find(params[:id])
	end

	def new
		@idea = Idea.new
	end

	def create
		@idea = current_user.ideas.new(idea_params)

		if @idea.save
			redirect_to ideas_path
		else
			render :new
		end
	end

	def update
		# @idea = Idea.find(params[:id])
		@idea = current_user.ideas.find(params[:id])
		if @idea.update(idea_params)
			redirect_to ideas_path
		else
			render :edit
		end		
	end

	def destroy
		@idea = Idea.find(params[:id])
		@idea.destroy
		redirect_to ideas_path
	end

	private
 	def idea_params
	  params.require(:idea).permit(:name, :body, :category_id)
  end

  def authorize
  	if current_user.nil?
  		redirect_to login_path, alert: "Not authorized"
  	end
  end

end
