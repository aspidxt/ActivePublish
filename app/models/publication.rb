class Publication < ApplicationRecord
  validates :title, presence: true,
            length: { minimum: 5 }

  validates :user_id, presence: true
  belongs_to :user
  has_one :chatroom
end
