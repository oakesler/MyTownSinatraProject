class LocationType < ActiveRecord::Base
  has_many :location_location_types
  has_many :locations through: :location_location_types
end