class AddTwitterToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :twitter, :string
  	add_index  :users, :twitter
  end
end
