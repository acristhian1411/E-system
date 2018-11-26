# == Schema Information
#
# Table name: sucursals
#
#  id          :bigint(8)        not null, primary key
#  direccion   :string
#  encargado   :string
#  suc_active  :boolean          default(TRUE)
#  suc_descrip :string
#  telefono    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#  suc_active  :boolean

#  direccion   :string
#  encargado   :string
#  suc_active  :boolean          default(TRUE)

#  suc_descrip :string
#  telefono    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SucursalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
