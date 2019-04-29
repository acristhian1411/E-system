# == Schema Information
#
# Table name: traslados
#
#  id               :bigint(8)        not null, primary key
#  activo           :boolean
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

class Traslado < ApplicationRecord
  has_paper_trail

  belongs_to :admin_user
  has_many :sucursal
  has_many :traslado_detalles

  accepts_nested_attributes_for :traslado_detalles

  validates :admin_user_id, :presence => true
  validates :sucursal_origen, :presence => true
  validates :sucursal_destino, :presence => true
  validates :fecha, :presence => true
  validates :motivo, :presence => true

  class << self
  def comprobante
    traslado = order('created_at desc').limit(1).first
    if traslado
      "Traslado-#{traslado.num_comprobante + 1}"
    else
      "Traslado-1"
    end
  end

    def usuario(usuario)
        usuario.email
    end

    def activo
			Traslado.where('activo != ?', true)
		end

    def sucursal(id)
      if id == 3
        return "RUTA 1"
      end
      if id == 2
      return  "GRAL ARTIGAS"
      end
      if id == 1
      return  "CASA MATRIZ"
      end
    end

end

# Funcion para listar segun este activo o no
# Todos los inactivos
scope :inactivo, -> {
  where('activo != ?', true)
}
# Todos los activos
  scope :activo, -> {
  where(:activo => true)
}
# Todos los registros
  scope :todos, -> {
  all
}


end
