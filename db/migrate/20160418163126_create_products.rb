class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.float :price, null: false
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
