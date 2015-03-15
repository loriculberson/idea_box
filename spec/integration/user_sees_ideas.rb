require 'rails_helper'

RSpec.describe "the users idea view", type: :feature do
	let(:user) { User.new(username: "Lori", password: "password", role: 0)}
  let(:idea) { Idea.create(name: 'Great idea', body: 'go hiking in a land far away'), user_id:1 }

  def log_in_user
    visit login_path
    fill_in 'username', :with => "Sam"
    fill_in 'password', :with => "password"
    click_link_or_button 'login'
  end

	it "can see ideas on page" do
    expect(page).to have_content('Great idea')
  end

  it "can logout of user idea page" do
    log_in_user
    click_link_or_button 'logout'
    expect(page).to have_content("Login to My Idea Box")
  end
end