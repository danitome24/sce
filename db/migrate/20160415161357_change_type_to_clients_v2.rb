class ChangeTypeToClientsV2 < ActiveRecord::Migration
  def change
    change_column :clients, :card_number, :integer
    change_column :clients, :expiration_month, :integer
    change_column :clients, :expiration_year, :integer
    change_column :clients, :cvv, :integer
  end
end
