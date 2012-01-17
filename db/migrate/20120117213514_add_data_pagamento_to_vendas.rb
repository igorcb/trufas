class AddDataPagamentoToVendas < ActiveRecord::Migration
  def self.up
    add_column :vendas, :data_pagamento, :date
  end

  def self.down
    remove_column :vendas, :data_pagamento
  end
end
