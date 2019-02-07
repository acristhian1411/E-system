# == Schema Information
#
# Table name: clientes
#
#  id             :bigint(8)        not null, primary key
#  activo         :boolean
#  cli_telefono   :string
#  direccion      :string
#  limite_credito :integer
#  n_cedula       :string
#  nombre         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  barrio_id      :bigint(8)
#  ciudade_id     :bigint(8)
#
# Indexes
#
#  index_clientes_on_barrio_id   (barrio_id)
#  index_clientes_on_ciudade_id  (ciudade_id)
#
# Foreign Keys
#
#  fk_rails_...  (barrio_id => barrios.id)
#  fk_rails_...  (ciudade_id => ciudades.id)
#

require 'test_helper'

class ClienteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
