class Category < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :idea
end
