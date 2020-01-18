class CreateGuideLocations < ActiveRecord::Migration
  def change
    create_table :guide_locations do |t|
      t.integer :guide_id
      t.integer :location_id
    end
  end
end