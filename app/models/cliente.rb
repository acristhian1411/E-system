# == Schema Information
#
# Table name: clientes
#
#  id             :bigint(8)        not null, primary key
#  activo         :boolean          default(TRUE)
#  apellido       :string
#  cli_telefono   :string
#  direccion      :string
#  limite_credito :integer
#  n_cedula       :string
#  nombre         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  barrio_id      :bigint(8)
#  ciudade_id     :bigint(8)
#
# Indexes
#
#  index_clientes_on_barrio_id   (barrio_id)
#  index_clientes_on_ciudade_id  (ciudade_id)
#
# Foreign Keys
#
#  fk_rails_...  (barrio_id => barrios.id)
#  fk_rails_...  (ciudade_id => ciudades.id)
#

class Cliente < ApplicationRecord

# relacion con otras tablas
  belongs_to :ciudade
  belongs_to :barrio

# Validaciones
  validates_associated :ciudade
  validates_associated :barrio
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :cli_telefono, presence: true
  validates :direccion, presence: true
  validates :limite_credito , presence: true
  validates :limite_credito, numericality: { only_integer: true }
  validates :n_cedula, presence: true
  validates :n_cedula, uniqueness: true
  validates :n_cedula, numericality: { only_integer: true }
# Funcion para listar segun este activo o no
  	scope :inactivo, -> {
  where('activo != ?', true)
}
	scope :activo, -> {
  where(:activo => true)
}
	scope :todos, -> {
  all
}
end
