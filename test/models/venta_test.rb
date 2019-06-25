# == Schema Information
#
# Table name: venta
#
#  id            :bigint(8)        not null, primary key
#  activo        :boolean          default(TRUE)
#  fecha         :date
#  forma_pago    :string
#  num_factura   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :bigint(8)
#  cliente_id    :bigint(8)
#  sucursal_id   :bigint(8)
#
# Indexes
#
#  index_venta_on_admin_user_id  (admin_user_id)
#  index_venta_on_cliente_id     (cliente_id)
#  index_venta_on_sucursal_id    (sucursal_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_user_id => admin_users.id)
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (sucursal_id => sucursals.id)
#

require 'test_helper'

class VentaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
