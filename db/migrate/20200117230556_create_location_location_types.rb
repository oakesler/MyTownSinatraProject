class CreateLocationLocationTypes < ActiveRecord::Migration
  def change
    create_table :location_location_types do |t|
      t.integer :location_id
      t.integer :location_type_id
    end
  end
end
