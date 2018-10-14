class SubCategory < ApplicationRecord
  belongs_to :category
  	scope :inactivo, -> {
  where('subcat_active != ?', true)
}
	scope :activo, -> {
  where(:subcat_active => true)
}
	scope :todos, -> {
  all
}
end
