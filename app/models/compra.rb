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
end
