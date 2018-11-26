class RemoveDescuentoToCompra < ActiveRecord::Migration[5.2]
  def change
    remove_column :compras, :descuento
  end
end
