class Message < ApplicationRecord
  validates :author, presence: true
  validates :content, presence: true
  validates :is_french, presence: true
end
