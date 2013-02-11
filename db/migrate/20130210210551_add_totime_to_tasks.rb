class AddTotimeToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :to_hour, :string
  	add_index  :tasks, :to_hour
  	add_column :tasks, :to_minute, :string
  	add_index  :tasks, :to_minute
  end
end
