class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :email
      t.string :item
      t.string :date

      t.timestamps
    end
  end
end
