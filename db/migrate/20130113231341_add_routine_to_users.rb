class AddRoutineToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :routine, :string
  	add_index  :users, :routine 
  end
end
