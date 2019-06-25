class AddCajaIdToCabCaja < ActiveRecord::Migration[5.2]
  def change
    add_reference :cab_cajas, :cajas, foreign_key: true
  end
end
