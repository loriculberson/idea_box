require 'rails_helper'

RSpec.describe "the idea view", type: :feature do
  
	let(:user) { User.new(username: "Sam", password: "password", role: 0)}
  let(:idea) { Idea.create(name: 'Great idea', body: 'go hiking in a land far away'), user_id:1 }

	it "logged in user can see ideas on page" do
      visits user_path(user)
      expect(page).to have_content('Dream')
  end



end