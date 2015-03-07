class Idea < ActiveRecord::Base
	validates :name, :body, presence: true

end
