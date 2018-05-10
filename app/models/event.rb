class EventTimeValidator < ActiveModel::Validator
  def validate(event)
  	if event.end_time.present? && event.start_time.present?
    	if event.start_time > event.end_time
      		event.errors[:base] << "Events must end after they start"
    	end
	end
  end
end

class EventLocationValidator < ActiveModel::Validator
  def validate(event)
  	if (event.latitude&.nonzero? && !event.longitude&.nonzero?) || (!event.latitude&.nonzero? && event.longitude&.nonzero?) 
      	event.errors[:base] << "Both latitude and longitude must be present"
	end
  end
end

class Event < ApplicationRecord
	belongs_to :user
	default_scope -> { order(start_time: :asc) }
	validates :name,  presence: true, length: { maximum: 90 }
	validates :start_time,  presence: true
	validates :about, length: { maximum: 1300 }
	validates :location_name, length: { maximum: 90 }
	validates :address, length: { maximum: 90 }
	validates_with EventTimeValidator
	validates_with EventLocationValidator
	validates :user_id, presence: true
end
