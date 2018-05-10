require 'rails_helper'

RSpec.describe User, type: :model do
	it 'should be valid' do
		user = create(:user)
		expect(user.valid?).to be true
	end

	it 'should have a username' do
		user = create(:user)
		user.username = "Test Username"
		expect(user.valid?).to be true
	end
end
