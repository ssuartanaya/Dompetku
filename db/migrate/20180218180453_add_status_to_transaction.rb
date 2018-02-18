class AddStatusToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :status, :boolean
  end
end
