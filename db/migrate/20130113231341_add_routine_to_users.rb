class AddRoutineToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :routine, :text, :limit => nil 
  	add_index  :users, :routine 
  end
end
