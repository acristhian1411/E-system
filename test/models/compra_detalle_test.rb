# == Schema Information
#
# Table name: compra_detalles
#
#  id            :bigint(8)        not null, primary key
#  cantidad      :integer
#  descuento     :integer
#  precio_compra :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  compra_id     :bigint(8)
#  producto_id   :bigint(8)
#
# Indexes
#
#  index_compra_detalles_on_compra_id    (compra_id)
#  index_compra_detalles_on_producto_id  (producto_id)
#
# Foreign Keys
#
#  fk_rails_...  (compra_id => compras.id)
#  fk_rails_...  (producto_id => productos.id)
#

require 'test_helper'

class CompraDetalleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
