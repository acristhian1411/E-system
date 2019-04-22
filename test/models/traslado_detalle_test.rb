# == Schema Information
#
# Table name: traslado_detalles
#
#  id          :bigint(8)        not null, primary key
#  cantidad    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  producto_id :bigint(8)
#  traslado_id :bigint(8)
#
# Indexes
#
#  index_traslado_detalles_on_producto_id  (producto_id)
#  index_traslado_detalles_on_traslado_id  (traslado_id)
#
# Foreign Keys
#
#  fk_rails_...  (producto_id => productos.id)
#  fk_rails_...  (traslado_id => traslados.id)
#

require 'test_helper'

class TrasladoDetalleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
