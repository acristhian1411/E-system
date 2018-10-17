class AddDireccionToCliente < ActiveRecord::Migration[5.2]
  def change
    add_column :clientes, :direccion, :string
  end
end
