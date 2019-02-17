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
<<<<<<< HEAD

  has_paper_trail
=======
    has_paper_trail
	
	has_versions(
	    meta: {
	      admin_user:[:id] :admin_user[:id], # model attribute
	       }
  	)
>>>>>>> 2fb7d327517539720b7b234cdeabcf76b1d484dd

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
