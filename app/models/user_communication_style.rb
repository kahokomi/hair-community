class UserCommunicationStyle < ApplicationRecord
  belongs_to :user
  belongs_to :communication_style
end