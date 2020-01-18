class AddLocationTypeIdsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :location_type_id, :integer
  end
end
