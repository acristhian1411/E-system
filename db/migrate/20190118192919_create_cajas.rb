class CreateCajas < ActiveRecord::Migration[5.2]
  def change
    create_table :cajas do |t|
      t.string :descripcion
      t.boolean :activo

      t.timestamps
    end
  end
end
