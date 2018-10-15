class CreateSucursals < ActiveRecord::Migration[5.2]
  def change
    create_table :sucursals do |t|
      t.string :suc_descrip
      t.boolean :suc_active

      t.timestamps
    end
  end
end
