# == Schema Information
#
# Table name: cab_cajas
#
#  id                :bigint(8)        not null, primary key
#  estado            :boolean          default(TRUE)
#  fecha_apertura    :date
#  fecha_cierre      :date
#  fecha_transaccion :date
#  monto             :float
#  num_comprobante   :string
#  tipo_mov          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cajas_id          :bigint(8)
#
# Indexes
#
#  index_cab_cajas_on_cajas_id  (cajas_id)
#
# Foreign Keys
#
#  fk_rails_...  (cajas_id => cajas.id)
#

require 'test_helper'

class CabCajaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
