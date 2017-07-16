class ChatroomsMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :chatroom_members do |t|
      t.references :chatroom, foreign_key: { on_delete: :cascade }
      t.references :chat_user, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
