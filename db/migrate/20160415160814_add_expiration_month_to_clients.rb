class AddExpirationMonthToClients < ActiveRecord::Migration
  def change
    add_column :clients, :expiration_month, :string
  end
end
