class AddMotivoToTraslado < ActiveRecord::Migration[5.2]
  def change
    add_column :traslados, :motivo, :string
  end
end
