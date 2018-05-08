require 'rails_helper'

RSpec.describe Event, type: :model do
  describe Event do
  	it 'should be valid' do
  		event = create(:event)
  		expect(event.valid?).to be true
  	end
  end

  describe Event, "#name" do
  	it 'should be present' do
  		event = create(:event)
  		expect(event.name).to eq 'Happy Hour'
  	end

  	it 'requires a name' do
  		event = build(:event, name: '')
  		expect(event.valid?).to be false

  		event = build(:event, name: nil)
  		expect(event.valid?).to be false
  	end

  	it 'fails create with name too long' do
  		event = build(:event, name: "a" * 91)
  		expect(event.valid?).to be false

  		event = build(:event, name: "a" * 90)
  		expect(event.valid?).to be true
  	end
  end

  describe Event, "#start_time" do
  	it 'should be present' do
  		event = create(:event)
  		expect(event.start_time).to eq DateTime.now.beginning_of_day
  	end

  	it 'fails create with no start time' do
  		event = build(:event, start_time: nil)
  		expect(event.valid?).to be false
  	end
  end

  describe Event, "#end_time" do
  	it 'should be present' do
  		event = create(:event)
  		expect(event.end_time).to eq DateTime.now.end_of_day
  	end

  	it 'fails to save with end time before start time' do
  		event = build(:event, start_time: DateTime.now.beginning_of_day, end_time: DateTime.now - 2.days)
  		expect(event.valid?).to be false
  	end

  	it 'end_time is not required' do
  		event = build(:event, end_time: nil)
  		expect(event.valid?).to be true
  	end
  end

  describe Event, "#about" do
	it 'should be present' do
  		event = create(:event)
  		expect(event.about).to eq 'This is a very fun event'
  	end

  	it 'about is not required' do
  		event = build(:event, about: nil)
  		expect(event.valid?).to be true
  	end

  	it 'fails create with about too long' do
  		event = build(:event, about: "a" * 1299)
  		expect(event.valid?).to be true

  		event = build(:event, about: "a" * 1301)
  		expect(event.valid?).to be false  		
  	end
  end

  describe Event, "#location_name" do
  	it 'should be present' do
  		event = create(:event)
  		expect(event.location_name).to eq 'Hardware Bar'
  	end

  	it 'location_name is not required' do
  		event = build(:event, location_name: nil)
  		expect(event.valid?).to be true
  	end

  	it 'fails create with location_name too long' do
  		event = build(:event, location_name: "a" * 91)
  		expect(event.valid?).to be false

  		event = build(:event, location_name: "a" * 90)
  		expect(event.valid?).to be true
  	end
  end

  describe Event, "#address" do
	it 'should be present' do
  		event = create(:event)
  		expect(event.address).to eq '697 10th Ave, New York, NY 10036'
  	end

  	it 'address is not required' do
  		event = build(:event, address: nil)
  		expect(event.valid?).to be true
  	end

  	it 'fails create with address too long' do
  		event = build(:event, address: "a" * 91)
  		expect(event.valid?).to be false

  		event = build(:event, address: "a" * 90)
  		expect(event.valid?).to be true
  	end
  end

  describe Event, "#latitude and #longitude" do
	it 'should be present' do
  		event = create(:event)
  		expect(event.latitude).to eq 40.763233
  		expect(event.longitude).to eq -73.9955277
  	end

  	it 'latitude and longitude are not required' do
  		event = build(:event, latitude: nil, longitude: nil)
  		expect(event.valid?).to be true
  	end

  	it 'only latitude fails validation' do
  		event = build(:event, latitude: 40.763233, longitude: nil)
  		expect(event.valid?).to be false

  		event = build(:event, latitude: 40.763233, longitude: 0)
  		expect(event.valid?).to be false
  	end

  	it 'only longitude fails validation' do
  		event = build(:event, latitude: nil, longitude: -73.9955277)
  		expect(event.valid?).to be false

  		event = build(:event, latitude: 0, longitude: -73.9955277)
  		expect(event.valid?).to be false
  	end
  end
end
