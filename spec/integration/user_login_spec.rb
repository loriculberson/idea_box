require 'rails_helper'

RSpec.describe "the idea view", type: :feature do

  let(:user) {
    User.create({username: 'bigwillie', password: 'password', role: 0})
  }

  context "with valid attributes" do

   it "cannot login without username" do
    visit login_path
    user = User.create({username: nil, password: 'password', role: 0})
    click_link_or_button "login"
    within("#errors") do
      expect(page).to have_text("Invalid")
    end
  end

  it "cannot login without password" do
    visit login_path
    user = User.create({username: 'bigwillie', password: nil, role: 0})
    click_link_or_button "login"
    within("#errors") do
      expect(page).to have_text("Invalid")
    end
  end

  it "registered users can login" do
    user = User.create(username: "bigwillie",  password: "password", role: 0)
    visit login_path
    fill_in "session[username]", with: "bigwillie"
    fill_in "session[password]", with: "password"
    click_link_or_button "login"
    save_and_open_page
    within("#my_ideas") do
      expect(page).to have_text("bigwillie's Idea Box")
    end
  end



  # test "registered user cannot view other users' profile" do
  #   ApplicationController.any_instance.stubs(:current_user).returns(user)
  #   #overriding current user (From application controller) instead use the user created in the setup
  #   #the user is the current_user but we don't want them to have access to anyone elses page
  #   protected_user = User.create(username: "Protected",  password: "password", password_confirmation: "password")
  #   visit user_path(protected_user)
  #   within("#flash_dumbass") do
  #     assert page.has_content?("You are not authorized to access this page")
  #   end
  # end

  # test "an admin user can view any user's profile" do
  #   admin_user = User.create(username: "admin",  password: "password", password_confirmation: "password", role: "admin")
  #   ApplicationController.any_instance.stubs(:current_user).returns(admin_user)
  #   visit user_path(user)
  #   within("#banner") do
  #     assert page.has_content?("Richard's Music List")
  #   end
  # end


	end
end
