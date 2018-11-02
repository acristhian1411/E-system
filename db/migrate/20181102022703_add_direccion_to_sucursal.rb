class AddDireccionToSucursal < ActiveRecord::Migration[5.2]
  def change
    add_column :sucursals, :direccion, :string
    add_column :sucursals, :encargado, :string
    add_column :sucursals, :telefono, :string
  end
end
