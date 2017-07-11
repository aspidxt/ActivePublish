class ChatUser < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :chatrooms, through: :messages
  validates :nickname, presence: true, uniqueness: true
end
