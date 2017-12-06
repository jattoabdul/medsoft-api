class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :reg_id
      t.string :full_name
      t.string :username
      t.string :sex
      t.string :password_digest
      t.text :address
      t.string :phone_number
      t.string :email
      t.date :date_employed
      t.boolean :is_admin

      t.timestamps
    end
  end
end
