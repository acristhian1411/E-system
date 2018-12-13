class AddNumComprobanteToTraslado < ActiveRecord::Migration[5.2]
  def change
    add_column :traslados, :num_comprobante, :integer
  end
end
