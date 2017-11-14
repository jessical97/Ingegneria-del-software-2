# Create the table used for stored Activity information
class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.decimal :hours
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
