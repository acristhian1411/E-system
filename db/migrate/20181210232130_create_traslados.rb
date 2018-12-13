class CreateTraslados < ActiveRecord::Migration[5.2]
  def change
    create_table :traslados do |t|
      t.integer :sucursal_origen
      t.integer :sucursal_destino
      t.date :fecha
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
