# == Schema Information
#
# Table name: compras
#
#  id            :bigint(8)        not null, primary key
#  fecha_compra  :date
#  num_factura   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :bigint(8)
#  provider_id   :bigint(8)
#
# Indexes
#
#  index_compras_on_admin_user_id  (admin_user_id)
#  index_compras_on_provider_id    (provider_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_user_id => admin_users.id)
#  fk_rails_...  (provider_id => providers.id)
#

class Compra < ApplicationRecord

  belongs_to :provider
  belongs_to :admin_user
  has_many :compra_detalles

  accepts_nested_attributes_for :compra_detalles, :allow_destroy => true

  validates :provider_id, :presence => true
  validates :admin_user_id, :presence => true
  validates :fecha_compra, :presence => true
  validates :num_factura, :presence => true

  attr_accessor :provider_id, :admin_user_id, :fecha_compra, :num_factura, :compra_detalles_attributes

  def compra_detalles_total
    compra_detalles_total = 0
    self.compra_detalles.each do |i|
      compra_detalles_total += i.total
    end
    compra_detalles_total
  end
  def total
    compra_detalles_total
  end

end
