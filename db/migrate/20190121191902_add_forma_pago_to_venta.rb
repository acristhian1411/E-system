class AddFormaPagoToVenta < ActiveRecord::Migration[5.2]
  def change
    add_column :venta, :forma_pago, :string
  end
end
