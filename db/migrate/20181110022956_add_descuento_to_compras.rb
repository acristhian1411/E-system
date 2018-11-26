class AddDescuentoToCompras < ActiveRecord::Migration[5.2]
  def change
    add_column :compras, :descuento, :integer
  end
end
