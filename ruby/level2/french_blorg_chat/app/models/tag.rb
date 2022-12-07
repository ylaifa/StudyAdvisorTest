class Tag < ApplicationRecord
  has_many :messages

  TAG_NAMES = {"Urgent": 1, "Secret": 2, "Rigolo": 3}
end
