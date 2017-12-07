# Add a foreign key reference to activities
class AddForeignKeyToBillInActivities < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :activities, :bills
  end
end
