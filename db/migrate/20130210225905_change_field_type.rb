class ChangeFieldType < ActiveRecord::Migration
	def up
	  	remove_column :tasks, :to_minute, :string
	  	remove_column :tasks, :minute, :string
	  end
	end
 
