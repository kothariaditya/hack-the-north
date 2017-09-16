class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :diagnosis
      t.string :symptoms
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
