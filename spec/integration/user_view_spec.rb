require 'rails_helper'

RSpec.describe "the idea view", type: :feature do
  
  let(:user) { User.create(username: 'Jenna', password: 'password', role:0) }

  xit "cannot login without valid username and password" do
  	visit login_path
		fill_in 'username', :with => nil
		fill_in 'password', :with => "password"

		click_link_or_button 'login'
		# refute page.has_content?("Welcome #{user.username}")
		expect(page).to have_content("Invalid entry")
  end

  xit "can login with valid username and password" do
		user = User.create(username: "Lori", password: "password", role: 0)

		visit login_path
		fill_in 'username', :with => "Lori"
		fill_in 'password', :with => "password"
		click_link_or_button 'login'
		
		expect(page).to have_content(user.username)
  end

  xit "can logout of user dashboard" do
		user = User.create(username: "Lori", password: "password")

		visit login_path
		fill_in 'username', :with => 'Lori'
		fill_in 'password', :with => "password"
save_and_open_page
		click_link_or_button 'login'

		visit user_path(user.id)
		click_link_or_button 'logout'
		expect(page).to have_content("Login to My Idea Box")
  end

end
