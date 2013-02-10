class AddTimeToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :hour, :string
  	add_index  :tasks, :hour
  	add_column :tasks, :minute, :string
  	add_index  :tasks, :minute
  end
end
