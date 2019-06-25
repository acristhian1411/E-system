# == Schema Information
#
# Table name: providers
#
#  id             :bigint(8)        not null, primary key
#  email          :string
#  prov_active    :boolean          default(TRUE)
#  prov_direccion :string
#  razon_social   :string
#  ruc            :string
#  telefono       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
