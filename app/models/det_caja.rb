# == Schema Information
#
# Table name: det_cajas
#
#  id               :bigint(8)        not null, primary key
#  monto_cuota      :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cab_caja_id      :bigint(8)
#  cuota_cliente_id :bigint(8)
#
# Indexes
#
#  index_det_cajas_on_cab_caja_id       (cab_caja_id)
#  index_det_cajas_on_cuota_cliente_id  (cuota_cliente_id)
#
# Foreign Keys
#
#  fk_rails_...  (cab_caja_id => cab_cajas.id)
#  fk_rails_...  (cuota_cliente_id => cuota_clientes.id)
#

class DetCaja < ApplicationRecord
  belongs_to :cuota_cliente
  belongs_to :cab_caja
  validates :monto_cuota, presence: true
end
