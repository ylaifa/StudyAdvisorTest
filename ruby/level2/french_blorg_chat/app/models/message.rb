class Message < ApplicationRecord
  belongs_to :tag, optional: true

  validates :author, presence: true
  validates :content, presence: true
  validates :is_french, presence: true
end
