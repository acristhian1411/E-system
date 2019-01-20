class AddActiveToCompra < ActiveRecord::Migration[5.2]
  def change
    add_column :compras, :activo, :boolean
  end
end
