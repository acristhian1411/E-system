class AddTipMovToCabCaja < ActiveRecord::Migration[5.2]
  def change
    add_column :cab_cajas, :tipo_mov, :string
  end
end
