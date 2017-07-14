class Chatroom < ApplicationRecord
  has_many :chat_users, through: :messages
  has_many :messages
end
