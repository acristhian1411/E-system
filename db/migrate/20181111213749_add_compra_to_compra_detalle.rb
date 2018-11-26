class AddCompraToCompraDetalle < ActiveRecord::Migration[5.2]
  def change
    add_reference :compra_detalles, :compra, foreign_key: true
  end
end
