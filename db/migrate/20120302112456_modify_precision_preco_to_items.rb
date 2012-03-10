class ModifyPrecisionPrecoToItems < ActiveRecord::Migration
  def self.up
    change_column :items, :preco, :decimal, :precision => 8, :scale =>2
  end

  def self.down
    change_column :items, :preco, :decimal, :precision => 2
  end
end
