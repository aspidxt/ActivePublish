class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :chat_user
end
