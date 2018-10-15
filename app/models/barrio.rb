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
	has_many :cliente

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
