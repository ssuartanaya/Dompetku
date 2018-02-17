class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.date :tgl
      t.text :uraian
      t.integer :harga
      t.integer :id_user

      t.timestamps
    end
  end
end
