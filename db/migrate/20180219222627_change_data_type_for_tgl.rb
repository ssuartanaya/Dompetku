class ChangeDataTypeForTgl < ActiveRecord::Migration[5.1]
  def self.up
    change_table :transactions do |t|
      t.change :tgl, :date
    end
  end
  def self.down
    change_table :transactions do |t|
      t.change :tgl, :datetime
    end
  end
end
