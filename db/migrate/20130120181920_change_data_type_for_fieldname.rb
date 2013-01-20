class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def up
  	change_table :users do |t|
  		t.change :routine, :text, :limit => nil
  	end
  end

  def down
  	change_table :users do |t|
  		t.change :routine, :string
  	end
  end
end
