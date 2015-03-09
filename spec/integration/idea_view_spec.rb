require 'rails_helper'

RSpec.describe "the idea view", type: :feature do
  let(:user) { User.create!({username: 'bigwillie', password: 'password', role: 0 }) }
#user logs in to /login page
#upon login with valid credentials
#user is routed to a page of all his ideas

  context "with valid attributes" do
    it "displays users idea page" do
      idea = user.ideas.create!(name: 'Great idea', body: 'go hiking in a land far away')
      visit user_ideas_path(user)

      expect(page).to have_content(idea.name)
    end  

    it "allows user to create  idea" do
      visit user_ideas_path(user)
      click_link_or_button 'add idea'
      fill_in 'Name', :with => 'Dream'
      fill_in 'Body', :with => 'eat ice cream all day'
      
      click_link_or_button 'submit idea'

      expect(page).to have_content('Dream')
    end
  end

    it "can edit the idea" do
      idea = user.ideas.create!(name: 'old idea', body: 'old')
 			
 			visit edit_user_idea_path(user_id: user.id, id: idea.id)

      fill_in 'Name', :with => 'new idea name'
   		fill_in 'Body', :with => 'new idea body'
 			click_link_or_button 'update'

      within("#my_ideas") do
   			expect(page).to have_content('new idea name')
      end
 		end

 		it "can delete an idea" do
      idea = user.ideas.create!(name: 'old idea', body: 'old')

 			visit user_idea_path(user_id: user.id, id: idea.id)
 			click_link_or_button 'delete'

 			expect(page).not_to have_content('old idea')

 		end

  it "can view their idea's page" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_ideas_path(user)

    within("#my_ideas") do
     expect(page).to have_text("bigwillie's Idea Box")
      end
    end

  it "unregistered user cannot view a user's profile" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)

    visit user_ideas_path(user)
    within("#flash_dumbass") do
      assert page.has_content?("You are not authorized to access this page")
    end
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

 		# xit "can edit the idea" do
 		# 	idea = Idea.create({name: "old idea", body: "old body"})
 			
 		# 	visit edit_idea_path(idea.id)

   #    fill_in 'Name', :with => 'new idea name'
   # 		fill_in 'Body', :with => 'new idea body'

 		# 	click_link_or_button 'update'
 		
 		# 	expect(page).to have_content('Ideas')
 		# end

 		# xit "can delete and idea" do
 		# 	visit ideas_path
 		# 	click_link_or_button 'delete'

 		# 	expect(page).to have_content('Ideas')

 		# end
end