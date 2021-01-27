class UserHairStyle < ApplicationRecord
  belongs_to :user
  belongs_to :hair_style
end
