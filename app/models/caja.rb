# == Schema Information
#
# Table name: cajas
#
#  id          :bigint(8)        not null, primary key
#  activo      :boolean
#  descripcion :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Caja < ApplicationRecord
  has_paper_trail

  validates :descripcion, :presence => true

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
