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
=======

	 has_paper_trail
>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14

	class << self
		def activo
			Marca.where('marca_active != ?', true)
		end
	end

<<<<<<< HEAD

=======
>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14
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
