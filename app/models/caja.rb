# == Schema Information
#
# Table name: cajas
#
#  id          :bigint(8)        not null, primary key
#  activo      :boolean          default(TRUE)
#  descripcion :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Caja < ApplicationRecord
  has_paper_trail
  belongs_to :cab_caja


  validates :descripcion, :presence => true

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
