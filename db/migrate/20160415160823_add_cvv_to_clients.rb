class AddCvvToClients < ActiveRecord::Migration
  def change
    add_column :clients, :cvv, :string
  end
end
