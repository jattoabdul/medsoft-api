class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.references :drug, foreign_key: true
      t.string :customer_name
      t.integer :quantity_bought
      t.string :dosage
      t.decimal :total_price, precision: 10, scale: 2
      t.date :transaction_date

      t.timestamps
    end
  end
end
