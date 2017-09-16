class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
      t.string :description
      t.string :brand_name
      t.string :drug_name
      t.string :notes

      t.timestamps
    end
  end
end
