class RemoveCompraIdToCompraDetalles < ActiveRecord::Migration[5.2]
  def change
    remove_column :compra_detalles, :compra_id
  end
end
