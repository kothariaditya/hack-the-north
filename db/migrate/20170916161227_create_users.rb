class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :gender, null: false
      t.text :address
      t.string :country
      t.string :city
      t.date :birthday
      t.string :blood_type
      t.string :allergies
      t.string :major_diagnostics
      t.text :notes

      t.timestamps
    end
    add_index :users, :email
  end
end
