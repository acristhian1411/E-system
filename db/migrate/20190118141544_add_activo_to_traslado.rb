class AddActivoToTraslado < ActiveRecord::Migration[5.2]
  def change
    add_column :traslados, :activo, :boolean
  end
end
