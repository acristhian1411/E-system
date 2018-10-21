class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.references :provider, foreign_key: true
      t.references :category, foreign_key: true
      t.references :sub_category, foreign_key: true
      t.references :marca, foreign_key: true
      t.string :prod_descrip
      t.integer :iva
      t.float :precio_venta
      t.boolean :prod_active

      t.timestamps
    end
  end
end
