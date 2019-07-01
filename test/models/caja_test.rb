# == Schema Information
#
# Table name: cajas
#
#  id          :bigint(8)        not null, primary key
#  activo      :boolean          default(TRUE)
#  descripcion :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CajaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
