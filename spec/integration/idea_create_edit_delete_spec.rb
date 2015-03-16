require 'rails_helper'

RSpec.describe "the idea view", type: :feature do
  
  let(:user) { User.create(username: 'Jenna', password: 'password', role:0) }
  let(:idea) { Idea.create(name: 'Great idea', body: 'go hiking in a land far away', user_id: user.id) }
  context "with valid attributes" do
    it "creates and displays new idea" do
      category = Category.create!(name: "Food")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_idea_path
      fill_in 'Name', :with => 'Dream'
      fill_in 'Body', :with => 'eat ice cream all day'
      select('Food', :from => 'Category')
      click_link_or_button 'add idea'
      expect(page).to have_content('Dream')
      click_link_or_button "Dream"
      expect(page).to have_content("Food")
    end
  end

 		xit "can update the idea" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit edit_idea_path(idea.id)
      
      fill_in 'Name', :with => 'new idea name'
      fill_in 'Body', :with => 'new idea body'

      click_link_or_button 'update'
    
      expect(page).to have_content('Ideas')
    end

    xit "can delete an idea" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
 			visit idea_path(idea.id)
      click_link_or_button 'delete'
      expect(page).not_to have_content('Great idea')
 		end
end