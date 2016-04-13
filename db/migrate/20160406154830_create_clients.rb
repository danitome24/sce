class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.integer :phone, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.integer :postalcode, null: false
      t.integer :ccnumber, null: false
      t.references :user, index: true
      t.timestamps null: false
    end

  end
end
