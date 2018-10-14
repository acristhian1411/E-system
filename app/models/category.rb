class Category < ApplicationRecord
	#scope :activo, where(:category_active => true)
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
