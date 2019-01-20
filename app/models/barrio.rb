# == Schema Information
#
# Table name: barrios
#
#  id          :bigint(8)        not null, primary key
#  activo      :boolean          default(TRUE)
#  descripcion :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Barrio < ApplicationRecord
# Relacion con otras tablas
	has_many :cliente
    has_paper_trail
	

# Validaciones
	validates :descripcion, presence: true

	class << self
    def activo
      Barrio.where('activo != ?', true)
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
