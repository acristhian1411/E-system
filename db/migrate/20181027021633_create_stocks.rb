class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :producto, foreign_key: true
      t.references :sucursal, foreign_key: true
      t.integer :cantidad
      t.integer :cant_minima

      t.timestamps
    end
  end
end
