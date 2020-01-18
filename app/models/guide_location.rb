class GuideLocation < ActiveRecord::Base
  belongs_to :guide
  belongs_to :location
end