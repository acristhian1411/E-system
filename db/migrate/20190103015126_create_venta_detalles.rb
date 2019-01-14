class CreateVentaDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :venta_detalles do |t|
      t.references :venta, foreign_key: true
      t.references :producto, foreign_key: true
      t.integer :cantidad
      t.float :monto_desc
      t.float :porcent_desc

      t.timestamps
    end
  end
end
