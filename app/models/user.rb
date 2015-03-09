class User < ActiveRecord::Base
	validate :username, :password, :role 
	has_secure_password
	has_many :ideas 

	enum role: %w(default admin)
end
