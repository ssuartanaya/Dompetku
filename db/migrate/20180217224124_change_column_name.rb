class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :transactions, :id_user, :user_id
  end
end
