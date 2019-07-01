class CreateDetCajas < ActiveRecord::Migration[5.2]
  def change
    create_table :det_cajas do |t|
      t.float :monto_cuota
      t.references :cuota_cliente, foreign_key: true

      t.timestamps
    end
  end
end
