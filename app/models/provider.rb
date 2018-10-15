# == Schema Information
#
# Table name: providers
#
#  id             :bigint(8)        not null, primary key
#  email          :string
#  prov_active    :boolean
#  prov_direccion :string
#  razon_social   :string
#  ruc            :string
#  telefono       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Provider < ApplicationRecord

	scope :inactivo, -> {
  where('prov_active != ?', true)
}
	scope :activo, -> {
  where(:prov_active => true)
}
	scope :todos, -> {
  all
}
end
