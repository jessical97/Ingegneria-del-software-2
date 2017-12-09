# THis migration resolve a bug that didn't permit to delete a bill
class AddCascadeEffectsToBill < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :activities, :bills
    add_foreign_key :activities, :bills, dependent: :nullify
  end
end
