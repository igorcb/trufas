class CreateVendas < ActiveRecord::Migration
  def self.up
    create_table :vendas do |t|
      t.references :cliente
      t.boolean :pago

      t.timestamps
    end
  end

  def self.down
    drop_table :vendas
  end
end
