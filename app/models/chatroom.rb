class Chatroom < ApplicationRecord
  has_many :chat_users, through: :messages
  has_many :chat_users, through: :chatroom_members
  has_many :messages
  has_many :chatroom_members
end
