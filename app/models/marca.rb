class Marca < ApplicationRecord
	scope :inactivo, -> {
  where('marca_active != ?', true)
}
	scope :activo, -> {
  where(:marca_active => true)
}
	scope :todos, -> {
  all
}
end
