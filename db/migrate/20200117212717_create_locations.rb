class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name 
      t.string :address 
      t.integer :city_id
      t.integer :user_id
      t.integer :guide_id
      ###
      t.string :type
      ####
    end
  end
end

