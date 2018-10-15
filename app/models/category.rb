# == Schema Information
#
# Table name: categories
#
#  id               :bigint(8)        not null, primary key
#  category_active  :boolean
#  category_descrip :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Category < ApplicationRecord
	scope :inactivo, -> {
  where('category_active != ?', true)
}
	scope :activo, -> {
  where(:category_active => true)
}
	scope :todos, -> {
  all
}
end
