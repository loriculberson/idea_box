require 'rails_helper'

RSpec.describe Idea, type: :model do


let(:idea) {
	Idea.new(name: "dream", body: "eat ice cream", user_id: 1)
}
	it "exits" do
		expect(idea).to be_valid
	end

	it "has valid attributes" do
		expect(idea.name).to eq("dream")
		expect(idea.body).to eq("eat ice cream")
	end

	it "is not valid without a name" do
		idea.name = nil
		expect(idea).not_to be_valid
	end

	it "is not valid without a name" do
		idea.body = nil
		expect(idea).not_to be_valid
	end

end
