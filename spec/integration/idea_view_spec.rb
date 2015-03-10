require 'rails_helper'

RSpec.describe "the idea view", type: :feature do
  
  let(:idea) { Idea.create(name: 'Great idea', body: 'go hiking in a land far away') }
  let(:user) { User.create(username: 'Jenna', password: 'password', role:0) }
  context "with valid attributes" do
    it "creates and displays new idea" do
      ApplicationController.any_instance.stub(:current_user).returns(user)
      visit new_idea_path
      fill_in 'Name', :with => 'Dream'
      fill_in 'Body', :with => 'eat ice cream all day'
      click_link_or_button 'add idea'
      save_and_open_page
      expect(page).to have_content('Dream')
    end
  end

 		xit "can edit the idea" do
 			idea = Idea.create({name: "old idea", body: "old body"})
 			
 			visit edit_idea_path(idea.id)

      fill_in 'Name', :with => 'new idea name'
   		fill_in 'Body', :with => 'new idea body'

 			click_link_or_button 'update'
 		
 			expect(page).to have_content('Ideas')
 		end

 		xit "can delete an idea" do
 			visit idea_path(idea.id)
 			click_link_or_button 'delete'

 			expect(page).to have_content('Ideas')

 		end

 	context "without valid attributes" do
    xit "cannot create and display new idea" do
      
      visit new_idea_path
      fill_in 'Name', :with => nil
   		fill_in 'Body', :with => 'eat ice cream all day'

   		click_link_or_button 'add idea'
   		within('#errors') do
      	expect(page).to have_content('blank')
   	 	end
    end
  end

 		xit "can edit the idea" do
 			idea = Idea.create({name: "old idea", body: "old body"})
 			
 			visit edit_idea_path(idea.id)

      fill_in 'Name', :with => 'new idea name'
   		fill_in 'Body', :with => 'new idea body'

 			click_link_or_button 'update'
 		
 			expect(page).to have_content('Ideas')
 		end

 		xit "can delete and idea" do
 			visit ideas_path
 			click_link_or_button 'delete'

 			expect(page).to have_content('Ideas')

 		end
end