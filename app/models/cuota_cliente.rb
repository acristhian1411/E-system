# == Schema Information
#
# Table name: cuota_clientes
#
#  id                 :bigint(8)        not null, primary key
#  cantidad_cuota     :integer
#  estado             :string
#  intereses          :float
#  monto_cuota        :float
#  monto_pagado       :float
#  vencimiento        :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  credito_cliente_id :bigint(8)
#
# Indexes
#
#  index_cuota_clientes_on_credito_cliente_id  (credito_cliente_id)
#
# Foreign Keys
#
#  fk_rails_...  (credito_cliente_id => credito_clientes.id)
#

class CuotaCliente < ApplicationRecord
  belongs_to :credito_clientes

    def saldo_cuota
          saldo = self.monto_cuota - self.monto_pagado
           return saldo
    end

end
