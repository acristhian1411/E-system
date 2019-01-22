class CreateCreditoClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :credito_clientes do |t|
      t.references :cliente, foreign_key: true
      t.references :venta, foreign_key: true

      t.timestamps
    end
  end
end
