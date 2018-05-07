Time.zone = 'EST'

100.times do |n|

	@start = Time.parse("7:30PM")
	@start = @start + n.days
	@end = @start + 2.hours

	Event.create(name: "#{Faker::RuPaul.queen} Presents: #{Faker::RuPaul.quote}",
		about:Faker::Hipster.paragraph(6),
		start_time: @start,
		end_time: @end,
		location_name: "Pieces",
		address: "8 Christopher St, New York, NY  10014, United States",
		latitude: 40.733837999999999,
		longitude: -74.000082000000006)

	@start = @start + 1.hours
	@end = @end + 1.hours

	Event.create(name: "Sexy #{Faker::Company.profession.capitalize}",
		about:Faker::Hipster.paragraphs(3),
		start_time: @start,
		location_name: "Hardware Bar",
		address: "697 10th Ave, New York, NY 10036",
		latitude: 40.763233,
		longitude: -73.9955277)

	@start = @start + 1.hours
	@end = @end + 1.hours

	Event.create(name: "#{Faker::Hipster.words.first.capitalize} and Chill",
		about:Faker::Hipster.paragraph(6),
		start_time: @start,
		location_name: "Nowhere Bar",
		address: "322 E 14th St, New York, NY 10003",
		latitude: 40.7317696,
		longitude: -73.9841161)

	Event.create(name: "#{Faker::RuPaul.queen} Presents: #{Faker::RuPaul.quote}",
		about:Faker::Hipster.paragraph(6),
		start_time: @start,
		end_time: @end,
		location_name: "The Stonewall Inn",
		address: "53 Christopher St, New York, NY 10014",
		latitude: 40.7338326,
		longitude: -74.0021626)

	Event.create(name: "Thirsty #{Faker::Company.profession.capitalize}",
		about:Faker::Hipster.paragraph(6),
		start_time: @start,
		end_time: @end,
		location_name: "Metropolitan",
		address: "559 Lorimer St, Brooklyn, NY 11211",
		latitude: 40.7136216,
		longitude: -73.951741)

end
