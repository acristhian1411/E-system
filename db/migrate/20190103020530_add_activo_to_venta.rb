class AddActivoToVenta < ActiveRecord::Migration[5.2]
  def change
    add_column :venta, :activo, :boolean
  end
end
