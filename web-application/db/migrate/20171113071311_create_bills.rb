# Create the table used for stored Bills information
class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.decimal :import
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
