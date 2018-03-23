class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|

      t.string :message, :null => false
      t.string :location
      t.datetime :datetime, :null => false
      t.string :status
      t.timestamps

    end
  end
end
