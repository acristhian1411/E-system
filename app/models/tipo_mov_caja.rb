# == Schema Information
#
# Table name: tipo_mov_cajas
#
#  id          :bigint(8)        not null, primary key
#  activo      :boolean
#  descripcion :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TipoMovCaja < ApplicationRecord
  has_paper_trail

end
