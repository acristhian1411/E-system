class CreateCompraDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :compra_detalles do |t|
      t.references :compra, foreign_key: true
      t.references :producto, foreign_key: true
      t.integer :cantidad
      t.float :precio_compra
      t.integer :descuento

      t.timestamps
    end
  end
end
