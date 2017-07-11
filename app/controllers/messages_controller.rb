class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.chat_user_id = current_user.chat_user.id

    if message.save
      ActionCable.server.broadcast 'messages',
                                   message: message.content,
                                   user: message.chat_user.nickname
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end