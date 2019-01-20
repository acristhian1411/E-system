# == Schema Information
#
# Table name: marcas
#
#  id            :bigint(8)        not null, primary key
#  marca_active  :boolean          default(TRUE)
#  marca_descrip :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Marca < ApplicationRecord
<<<<<<< HEAD
	 has_paper_trail
	
=======

	class << self
		def activo
			Marca.where('marca_active != ?', true)
		end
	end

>>>>>>> 85f54007fd9e0e1d62e0264fe5abf925923941d6
# Validaciones
	validates :marca_descrip, presence: true

# Funcion para listar segun este activo o no
	scope :inactivo, -> {
		# Todos los inactivos
  where('marca_active != ?', true)
}
# Todos los activos
	scope :activo, -> {
  where(:marca_active => true)
}
# Todos los registros
	scope :todos, -> {
  all
}
end
