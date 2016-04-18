class AddNamecardToClients < ActiveRecord::Migration
  def change
    add_column :clients, :namecard, :string
  end
end
