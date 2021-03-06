require 'rails_helper'

RSpec.describe "the idea view for different users", type: :feature do
 
  def log_in_user(user)
    visit login_path
    fill_in 'username', :with => user.username
    fill_in 'password', :with => user.password
    click_link_or_button 'login'
  end

  context "admin user " do
    it "can view all users ideas" do
      admin = User.create!(username: "Admin", password: "password", role: "admin")
      user = User.create!(username: "Lori", password: "password", role: "default")
      category = Category.create(name: "Shopping")
      Idea.create!(name: "incredible dinner", body: "Fogo de Chao", user_id: user.id, category: category )
      Idea.create!(name: "see fish", body: "Aquarium", user_id: user.id, category: category)
      log_in_user(admin)

      expect(page).to have_content("incredible dinner")
      expect(page).to have_content("see fish")
    end

    it "can view a user's idea details" do
      admin = User.create!(username: "Admin", password: "password", role: "admin" )
      user = User.create!(username: "Lori", password: "password", role: "default" )
      category = Category.create(name: "Shopping")
      idea = Idea.create!(name: "Venice", body: "travel to Italy", user_id: user.id, category: category)
      log_in_user(admin)

      click_link_or_button "Venice"
      expect(current_path).to eq(idea_path(idea))
    end



  end


end