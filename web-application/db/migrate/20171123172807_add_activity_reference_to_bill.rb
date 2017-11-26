# With this migration you can refernce an activity to a bill
class AddActivityReferenceToBill < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :bills, index: true
  end
end
