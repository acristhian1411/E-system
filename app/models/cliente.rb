class Cliente < ApplicationRecord
  belongs_to :ciudade
  belongs_to :barrio
end
