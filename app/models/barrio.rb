# == Schema Information
#
# Table name: barrios
#
#  id          :bigint(8)        not null, primary key
#  activo      :boolean
#  descripcion :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Barrio < ApplicationRecord
# Relacion con otras tablas
	has_many :cliente

    has_paper_trail
<<<<<<< HEAD
	
	has_versions
=======
>>>>>>> e185d681569d6d65915e8cacdb6c5197a4aa80f5

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
