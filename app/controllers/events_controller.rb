require 'event_serializer.rb'

class EventsController < ApplicationController
	# only accept json requests
	#before_action :check_format

	#def check_format
	  #redirect_to root_url unless params[:format] == 'json' || request.headers["Accept"] =~ /json/
	#end

	def index
    	@events = Event.all
    	json_data = EventSerializer.new(@events).serialized_json
    	respond_to do |format|
      		format.json { render json: json_data }
    	end
  end
end
