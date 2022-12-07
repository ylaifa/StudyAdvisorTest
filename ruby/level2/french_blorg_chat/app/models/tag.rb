class Tag < ApplicationRecord
  has_many :messages

  TAG_NAMES = ["Urgent" "Secret", "Rigolo"]
end
