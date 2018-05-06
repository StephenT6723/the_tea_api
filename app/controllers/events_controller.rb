require 'event_serializer.rb'

class EventsController < ApplicationController
	# only accept json requests
	#before_action :check_format

	#def check_format
	  #redirect_to root_url unless params[:format] == 'json' || request.headers["Accept"] =~ /json/
	#end

	def index
		defaultDays = 7
    	@days = params.has_key?(:days) ? params[:days].to_i: defaultDays
    	startDate = DateTime.now
    	endDate = startDate + @days - 1.days
    	endDate = endDate.end_of_day
    	@events = Event.where(:start_time => startDate..endDate)

    	json_data = EventSerializer.new(@events).serialized_json
    	respond_to do |format|
      		format.json { render json: json_data }
    	end
  end
end
