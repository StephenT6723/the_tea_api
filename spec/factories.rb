FactoryBot.define do
	factory :event do
		name "Happy Hour"
		start_time DateTime.now.beginning_of_day
		end_time DateTime.now.end_of_day
		about "This is a very fun event"
		location_name "Hardware Bar"
		address  "697 10th Ave, New York, NY 10036"
		latitude  40.763233
		longitude  -73.9955277
	end
end