class AddSaldoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :saldo, :integer
  end
end
