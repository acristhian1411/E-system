# == Schema Information
#
# Table name: sucursals
#
#  id          :bigint(8)        not null, primary key
#  direccion   :string
#  encargado   :string
#  suc_active  :boolean          default(TRUE)
#  suc_descrip :string
#  telefono    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sucursal < ApplicationRecord

has_paper_trail


# Relaciones con otras tablas
belongs_to :traslados

# Validaciones
	validates :suc_descrip, presence: true

	class << self
	  def activo
	    Sucursal.where('suc_active != ?', true)
	  end
	end

# Funcion para listar segun este activo o no
# Todos los inactivos
	scope :inactivo, -> {
  where('suc_active != ?', true)
}
	scope :activo, -> {
		# Todos los activos
  where(:suc_active => true)
}
# Todos los registros
	scope :todos, -> {
  all
}
end
