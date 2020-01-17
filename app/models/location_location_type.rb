class LocationLocationType < ActiveRecord::Base
  belongs_to :location
  belongs_to :location_type
end
