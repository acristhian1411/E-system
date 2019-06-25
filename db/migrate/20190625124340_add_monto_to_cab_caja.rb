class AddMontoToCabCaja < ActiveRecord::Migration[5.2]
  def change
    add_column :cab_cajas, :monto, :float
  end
end
