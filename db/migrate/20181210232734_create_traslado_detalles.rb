class CreateTrasladoDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :traslado_detalles do |t|
      t.references :producto, foreign_key: true
      t.references :traslado, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
