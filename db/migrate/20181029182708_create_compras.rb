class CreateCompras < ActiveRecord::Migration[5.2]
  def change
    create_table :compras do |t|
      t.references :provider, foreign_key: true
      t.references :admin_user, foreign_key: true
      t.date :fecha_compra
      t.string :num_factura

      t.timestamps
    end
  end
end
