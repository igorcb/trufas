class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.references :venda
      t.references :produto
      t.integer :qtde
      t.decimal :preco

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
