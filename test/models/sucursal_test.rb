# == Schema Information
#
# Table name: sucursals
#
#  id          :bigint(8)        not null, primary key
<<<<<<< HEAD
#  suc_active  :boolean
=======
#  direccion   :string
#  encargado   :string
#  suc_active  :boolean          default(TRUE)
>>>>>>> 851e55f4722dc881c757d64345547c8094d391fb
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
