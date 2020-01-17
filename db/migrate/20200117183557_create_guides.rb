class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :name 
      t.integer :user_id
      t.integer :city_id
    end
  end
end