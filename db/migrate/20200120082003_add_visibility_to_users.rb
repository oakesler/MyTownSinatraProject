class AddVisibilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :visibility, :string
  end
end