# == Schema Information
#
# Table name: providers
#
#  id             :bigint(8)        not null, primary key
#  email          :string
#  prov_active    :boolean
#  prov_direccion :string
#  razon_social   :string
#  ruc            :string
#  telefono       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Provider < ApplicationRecord
# Relaciones con otras tablas
has_many :compra
has_paper_trail

# Validaciones
	validates :razon_social, presence: true
	validates :ruc, presence: true
	validates :ruc, uniqueness: true

	validates :telefono, presence: true

	class << self
    def activo
      Provider.where('prov_active != ?', true)
    end
end

# Funcion para listar segun este activo o no
# Todos los inactivos
	scope :inactivo, -> {
  where('prov_active != ?', true)
}
# Todos los activos
	scope :activo, -> {
  where(:prov_active => true)
}
# Todos los registros
	scope :todos, -> {
  all
}
end
