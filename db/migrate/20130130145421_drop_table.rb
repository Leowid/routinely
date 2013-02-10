class DropTable < ActiveRecord::Migration
  def up
  	drop_table :tasks
  end

  def down
  end
end
