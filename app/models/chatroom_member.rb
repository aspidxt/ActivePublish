class ChatroomMember < ApplicationRecord
  # TODO: Destroy dependent chatroom if user removed
  belongs_to :chat_user
  belongs_to :chatroom
end
