# == Schema Information
#
# Table name: stocks
#
#  id          :bigint(8)        not null, primary key
#  cant_minima :integer
#  cantidad    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  producto_id :bigint(8)
#  sucursal_id :bigint(8)
#
# Indexes
#
#  index_stocks_on_producto_id  (producto_id)
#  index_stocks_on_sucursal_id  (sucursal_id)
#  productos por sucursal       (producto_id,sucursal_id)
#
# Foreign Keys
#
#  fk_rails_...  (producto_id => productos.id)
#  fk_rails_...  (sucursal_id => sucursals.id)
#

require 'test_helper'

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
