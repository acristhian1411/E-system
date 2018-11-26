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

require 'test_helper'

class SubCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
