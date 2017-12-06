class CreateDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :drugs do |t|
      t.string :name
      t.decimal :cost_price, precision: 10, scale: 2
      t.decimal :selling_price, precision: 10, scale: 2
      t.integer :stock_quantity
      t.string :manufacturer
      t.date :purchase_date
      t.date :expiry_date

      t.timestamps
    end
  end
end
