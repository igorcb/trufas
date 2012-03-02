class ModifyPrecisionPrecoToProduto < ActiveRecord::Migration
  def self.up
    change_column :produtos, :preco, :decimal, :precision => 8, :scale =>2
  end

  def self.down
    change_column :produtos, :preco, :decimal, :precision => 2
  end
end
