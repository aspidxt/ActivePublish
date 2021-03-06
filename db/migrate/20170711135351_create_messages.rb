class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :chatroom, foreign_key: true
      t.references :chat_user, foreign_key: true

      t.timestamps
    end
  end
end
