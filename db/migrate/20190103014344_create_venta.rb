class CreateVenta < ActiveRecord::Migration[5.2]
  def change
    create_table :venta do |t|
      t.references :admin_user, foreign_key: true
      t.references :sucursal, foreign_key: true
      t.references :cliente, foreign_key: true
      t.date :fecha
      t.integer :num_factura

      t.timestamps
    end
  end
end
