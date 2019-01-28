# == Schema Information
#
# Table name: credito_clientes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cliente_id :bigint(8)
#  venta_id   :bigint(8)
#
# Indexes
#
#  index_credito_clientes_on_cliente_id  (cliente_id)
#  index_credito_clientes_on_venta_id    (venta_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (venta_id => venta.id)
#

class CreditoCliente < ApplicationRecord
  belongs_to :cliente
  belongs_to :venta
  has_many :cuota_clientes

    def cuota_total
      cuota_total = 0
      self.cuota_clientes.each do |i|
        cuota_total += i.saldo_cuota
      end
      cuota_total
    end

    def total
      cuota_total
    end

end
