class IdeasController < ApplicationController

	def index
	# 	@ideas = Idea.all
	# end

		# if current_user.admin?
		# 	@ideas = Idea.all
		# elsif current_user
		if current_user
		@ideas = Idea.where(user_id: current_user.id)
		# else
			redirect_to login_path
		end
	end

	def show
		@idea = Idea.find(params[:user_id])
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
		@idea = Idea.find(params[:user_id])
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
	  params.require(:idea).permit(:name, :body)
  end

end
