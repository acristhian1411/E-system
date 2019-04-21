# == Schema Information
#
# Table name: venta_detalles
#
#  id           :bigint(8)        not null, primary key
#  cantidad     :integer
#  monto_desc   :float
#  porcent_desc :float
#  precio_venta :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  producto_id  :bigint(8)
#  venta_id     :bigint(8)
#
# Indexes
#
#  index_venta_detalles_on_producto_id  (producto_id)
#  index_venta_detalles_on_venta_id     (venta_id)
#
# Foreign Keys
#
#  fk_rails_...  (producto_id => productos.id)
#  fk_rails_...  (venta_id => venta.id)
#

require 'test_helper'

class VentaDetalleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
