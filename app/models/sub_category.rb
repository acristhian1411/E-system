# == Schema Information
#
# Table name: sub_categories
#
#  id             :bigint(8)        not null, primary key
#  subcat_active  :boolean
#  subcat_descrip :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :bigint(8)
#
# Indexes
#
#  index_sub_categories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#

class SubCategory < ApplicationRecord
has_paper_trail

# relacion con otras tablas
  belongs_to :category
  accepts_nested_attributes_for :category
# Validaciones
  validates :subcat_descrip, presence: true
  validates_associated :category

class << self
  def activo
    SubCategory.where('subcat_active != ?', true)
  end
end

# Funcion para listar segun este activo o no
# Todos los inactivos
  	scope :inactivo, -> {
  where('subcat_active != ?', true)
}
# Todos los activos
	scope :activo, -> {
  where(:subcat_active => true)
}
# Todos los registros
	scope :todos, -> {
  all
}
end
