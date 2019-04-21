class CreateCuotaClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :cuota_clientes do |t|
      t.references :credito_cliente, foreign_key: true
      t.integer :cantidad_cuota
      t.float :monto_cuota
      t.date :vencimiento
      t.float :intereses
      t.float :monto_pagado
      t.string :estado

      t.timestamps
    end
  end
end
