# == Schema Information
#
# Table name: traslados
#
#  id               :bigint(8)        not null, primary key
#  fecha            :date
#  motivo           :string
#  num_comprobante  :integer
#  sucursal_destino :integer
#  sucursal_origen  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  admin_user_id    :bigint(8)
#
# Indexes
#
#  index_traslados_on_admin_user_id  (admin_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_user_id => admin_users.id)
#

require 'test_helper'

class TrasladoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
