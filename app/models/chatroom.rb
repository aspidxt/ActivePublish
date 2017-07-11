class Chatroom < ApplicationRecord
  belongs_to :publication
  has_many :chat_users, through: :messages
  has_many :messages
end
