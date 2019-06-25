# == Schema Information
#
# Table name: barrios
#
#  id          :bigint(8)        not null, primary key
#  activo      :boolean          default(TRUE)
#  descripcion :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class BarrioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
