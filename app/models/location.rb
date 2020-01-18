class Location < ActiveRecord::Base
  belongs_to :user
  belongs_to :guide
  belongs_to :city
  has_many :location_location_types
  has_many :location_types, through: :location_location_types
end