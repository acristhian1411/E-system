class CreateCiudades < ActiveRecord::Migration[5.2]
  def change
    create_table :ciudades do |t|
      t.string :descripcion
      t.boolean :activo

      t.timestamps
    end
  end
end
