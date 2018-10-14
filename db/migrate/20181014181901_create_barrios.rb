class CreateBarrios < ActiveRecord::Migration[5.2]
  def change
    create_table :barrios do |t|
      t.string :descripcion
      t.boolean :activo

      t.timestamps
    end
  end
end
