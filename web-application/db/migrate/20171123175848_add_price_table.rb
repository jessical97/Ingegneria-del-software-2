class AddPriceTable < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.decimal :import

      t.timestamps
    end
    add_reference :bills, :prices, index: true
  end
end
