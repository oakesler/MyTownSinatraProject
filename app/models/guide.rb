class Guide < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_many :locations
  ##############
  has_many :guide_locations
  has_many :locations, through: :guide_locations
end