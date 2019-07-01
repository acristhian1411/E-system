class AddCabCajaIdToDetCaja < ActiveRecord::Migration[5.2]
  def change
    add_reference :det_cajas, :cab_caja, foreign_key: true
  end
end
