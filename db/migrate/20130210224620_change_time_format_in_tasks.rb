class ChangeTimeFormatInTasks < ActiveRecord::Migration
  def up
  	change_column :tasks, :hour, :time
    change_column :tasks, :to_hour, :time
  end

  def down
  	change_column :tasks, :hour, :string
  	change_column :tasks, :to_hour, :string
  end
end
