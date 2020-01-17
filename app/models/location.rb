class Location < ActiveRecord::Base
  belongs_to :user
  belongs_to :guide
  belongs_to :city
  has_many :types
end