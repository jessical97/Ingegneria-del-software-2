# Create the table used for stored Client information
class CreateClients < ActiveRecord::Migration[5.1]
  # rubocop:disable MethodLength
  def change
    create_table :clients do |t|
      t.string :type
      t.string :act_primary
      t.string :act_secondary
      t.string :name
      t.string :surname
      t.string :address
      t.string :cap
      t.string :city
      t.string :country
      t.string :ssn

      t.timestamps
    end
  end
  # rubocop:enable MethodLength
end
