class AddPrecioVentaToVentaDetalle < ActiveRecord::Migration[5.2]
  def change
    add_column :venta_detalles, :precio_venta, :float
  end
end
