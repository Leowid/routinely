class AddBioToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :bio, :string
  	add_index  :users, :bio 
  end
end
