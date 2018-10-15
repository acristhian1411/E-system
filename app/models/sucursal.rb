# == Schema Information
#
# Table name: sucursals
#
#  id          :bigint(8)        not null, primary key
#  suc_active  :boolean
#  suc_descrip :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sucursal < ApplicationRecord

	scope :inactivo, -> {
  where('suc_active != ?', true)
}
	scope :activo, -> {
  where(:suc_active => true)
}
	scope :todos, -> {
  all
}
end
