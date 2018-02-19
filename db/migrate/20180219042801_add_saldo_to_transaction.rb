class AddSaldoToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :saldo, :integer
  end
end
