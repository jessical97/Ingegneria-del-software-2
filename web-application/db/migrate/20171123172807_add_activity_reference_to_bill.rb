class AddActivityReferenceToBill < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :bills, index: true
  end
end
