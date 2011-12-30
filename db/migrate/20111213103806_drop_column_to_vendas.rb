class DropColumnToVendas < ActiveRecord::Migration
  def self.up
    remove_column :vendas, :produto_id
    remove_column :vendas, :qtde 
    remove_column :vendas, :preco 
  end

  def self.down
    add_column :vendas, :produto_id, :integer
    add_column :vendas, :qtde, :integer
    add_column :vendas, :preco, :decimal, :precision => 2
  end
end
