class User < ActiveRecord::Base
	has_secure_password
	validates :username, :password, presence: true
	has_many :ideas

  enum role: %w(default admin)

  def title_of_user_ideas
    @users = User.all.find(params[:idea])
    require 'pry';binding.pry
  end
end
