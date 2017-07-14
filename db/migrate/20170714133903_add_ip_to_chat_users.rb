class AddIpToChatUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :chat_users do |t|
      t.inet :session_ip
    end
  end

end
