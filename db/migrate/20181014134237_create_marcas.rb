class CreateMarcas < ActiveRecord::Migration[5.2]
  def change
    create_table :marcas do |t|
      t.string :marca_descrip
      t.boolean :marca_active

      t.timestamps
    end
  end
end
