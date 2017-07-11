class CreateChatrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chatrooms do |t|
      t.references :publication, foreign_key: true

      t.timestamps
    end
  end
end
