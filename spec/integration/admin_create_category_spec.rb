require 'rails_helper'

RSpec.describe "admin is able to add categories", type: :feature do 

  def log_in_user(user)
    visit login_path
    fill_in('username', with: user.username)
    fill_in('password', with: user.password)
    click_link_or_button 'login'
  end

  it "can add a category" do 
    admin = User.create(username: "admin", password: "password", role: 1)
    log_in_user(admin)
    click_link_or_button "create category"
    fill_in("category", with: "Quotes")
    click_link_or_button "submit"
    expect(page).to have_content("Quotes")
  end

  it "can edit a category" do
    admin = User.create(username: "admin", password: "password", role: 1)
    category = Category.create(name: "Old Category")
    log_in_user(admin)
    click_link_or_button "all categories"
    click_link_or_button "edit"
    fill_in("category", with: "New stuff")
    click_link_or_button "update"
    expect(current_path).to eq(categories_path)
    expect(page).to have_content("New stuff")
  end

  it "can delete a category" do
    admin = User.create(username: "admin", password: "password", role: 1)
    category = Category.create(name: "Old Category")
    log_in_user(admin)
    click_link_or_button "all categories"
    click_link_or_button "delete"
    expect(page).not_to have_content("Old Category")
  end
end