class AddDescuentoToCompraDetalles < ActiveRecord::Migration[5.2]
  def change
    add_column :compra_detalles, :porcent_desc, :float
  end
end
