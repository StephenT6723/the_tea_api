class Event < ApplicationRecord
	default_scope -> { order(start_time: :asc) }
end
