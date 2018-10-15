class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :razon_social
      t.string :ruc
      t.string :prov_direccion
      t.string :telefono
      t.string :email
      t.boolean :prov_active

      t.timestamps
    end
  end
end
