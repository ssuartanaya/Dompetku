class RemoveCategoryFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :category, :integer
  end
end
