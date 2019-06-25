class CreateCabCajas < ActiveRecord::Migration[5.2]
  def change
    create_table :cab_cajas do |t|
      t.date :fecha_apertura
      t.date :fecha_cierre
      t.string :num_comprobante
      t.date :fecha_transaccion

      t.timestamps
    end
  end
end
