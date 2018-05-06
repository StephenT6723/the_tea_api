class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :about, :start_time, :end_time, :location_name, :address, :latitude, :longitude
end
