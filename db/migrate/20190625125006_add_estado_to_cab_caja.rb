class AddEstadoToCabCaja < ActiveRecord::Migration[5.2]
  def change
    add_column :cab_cajas, :estado, :boolean
  end
end
