# == Schema Information
#
# Table name: productos
#
#  id              :bigint(8)        not null, primary key
#  iva             :integer
#  precio_venta    :float
#  prod_active     :boolean          default(TRUE)
#  prod_descrip    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :bigint(8)
#  marca_id        :bigint(8)
#  provider_id     :bigint(8)
#  sub_category_id :bigint(8)
#
# Indexes
#
#  index_productos_on_category_id      (category_id)
#  index_productos_on_marca_id         (marca_id)
#  index_productos_on_provider_id      (provider_id)
#  index_productos_on_sub_category_id  (sub_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (marca_id => marcas.id)
#  fk_rails_...  (provider_id => providers.id)
#  fk_rails_...  (sub_category_id => sub_categories.id)
#

class Producto < ApplicationRecord
  has_paper_trail


  belongs_to :provider
  belongs_to :category
  belongs_to :sub_category
  belongs_to :marca

  has_many :compra_detalle

  # Funcion para listar segun este activo o no
  # Todos los inactivos
  scope :inactivo, -> {
    where('prod_active != ?', true)
  }
  # Todos los activos
  	scope :activo, -> {
    where(:prod_active => true)
  }
  # Todos los registros
  	scope :todos, -> {
    all
  }
end
