class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.chat_user_id = chat_user.id
    if message.save
      ActionCable.server.broadcast 'messages',
                                   message: message.content,
                                   user: message.chat_user.nickname,
                                   user_chatroom: chatroom_path(slug: message.chat_user.id)
      head :ok
    end
  end


  private

  def message_params
    # TODO: fix security hole: messages can be sent to any chatrum by changing id
    params.require(:message).permit(:content, :chatroom_id)
  end

  def chat_user
    if current_user
      current_user.chat_user
    else
      c_user = ChatUser.find_by(session_ip: request.remote_ip, user_id: nil)
      c_user ? c_user : create_chat_user
    end
  end

  def create_chat_user
    # TODO: generate safe random names
    c_user = ChatUser.new(nickname: 'GuysFrom ' + request.remote_ip.to_s, session_ip: request.remote_ip)
    c_user.save
    c_user
  end
end