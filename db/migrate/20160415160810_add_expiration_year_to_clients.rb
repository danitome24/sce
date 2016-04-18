class AddExpirationYearToClients < ActiveRecord::Migration
  def change
    add_column :clients, :expiration_year, :string
  end
end
