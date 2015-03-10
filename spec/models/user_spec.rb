require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) {
	User.new(username: "Sam", password: "password", role: 0)
}
	it "exits" do
		expect(user).to be_valid
	end

	it "has valid attributes" do
		expect(user.username).to eq("Sam")
		expect(user.password).to eq("password")
	end

	it "is not valid without a username" do
		user.username = nil
		expect(user).not_to be_valid
	end

	it "is not valid without a username" do
		user.password = nil
		expect(user).not_to be_valid
	end



end
