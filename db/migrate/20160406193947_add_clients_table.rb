class AddClientsTable < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :firstname, null: false, default: ''
      t.string :lastname, null: false, default: ''
      t.integer :phone, null: false, default: ''
      t.string :address, null: false, default: ''
      t.string :city, null: false, default: ''
      t.integer :postalcode, null: false, default: ''
      t.integer :ccnumber, null: false, default: ''
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
