class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :measurement_unit
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
