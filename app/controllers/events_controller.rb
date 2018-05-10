#require 'event_serializer.rb'

class EventsController < ApplicationController
	def create
        user = User.first
        byebug
        @event = user.events.build(event_params)
        @event.save
        json_data = EventSerializer.new(@event).serialized_json
        render json: json_data
    end

    def index
    	defaultDayCount = 7
    	days = params.has_key?(:days) ? params[:days].to_i: defaultDayCount
    	@events = eventsWithin(days)
    	json_data = EventSerializer.new(@events).serialized_json
    	respond_to do |format|
            format.html
      		format.json { render json: json_data }
        end
    end

    def eventsWithin(days)
        return [] if days <= 0
        startDate = DateTime.now
        endDate = startDate + days - 1.days
        endDate = endDate.end_of_day
        Event.where(:start_time => startDate..endDate)
    end

    private

        def event_params
            params.permit(:name, :start_time, :end_time, :about, :location_name, :address, :latitude, :longitude)
        end
end
