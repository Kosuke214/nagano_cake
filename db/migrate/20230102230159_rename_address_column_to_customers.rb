class RenameAddressColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :address, :customer_address
  end
end
