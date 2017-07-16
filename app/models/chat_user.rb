class ChatUser < ApplicationRecord
  # belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages
  has_many :chatroom_members # chat_user can have many chatroom_member records
  validates :nickname, presence: true, uniqueness: true
end
