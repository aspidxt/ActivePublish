class ChatroomsController < ApplicationController

  def new
    @chatroom = Chatroom.new
  end

  def show
    companion = ChatUser.find_by(id: params.require(:slug))
    if current_user && companion.user_id
      @chatroom = chatroom_with(companion)
      @message = Message.new
    else
      # TODO: Redirect to error "user must be logged in / can send to logged in users only"
      redirect_to(:root)
    end
  end


  private

  def chatroom_with(chat_user)
    # TODO: refactor this!
    # sql = "SELECT min(chatroom_id) as id
    #       FROM chatroom_members
    #       GROUP BY chatroom_id
    #       HAVING count(chat_user_id) = 2
    #          AND min(chat_user_id) in(#{current_user.chat_user.id},
    #                                   #{chat_user.id})"

    sql = "SELECT min(a.chatroom_id) as id
          FROM chatroom_members as a
          JOIN chatroom_members as b
            ON a.chatroom_id = b.chatroom_id
           AND a.chat_user_id = #{current_user.chat_user.id}
           AND b.chat_user_id <> #{current_user.chat_user.id}
          GROUP BY b.chatroom_id
          HAVING count(b.chatroom_id) = 1
             AND min(b.chat_user_id) = #{chat_user.id}"
    chat_id = Chatroom.find_by_sql(sql)

    if chat_id == []
      create_private_chatroom(chat_user)
    else
      Chatroom.find_by(id: chat_id)
    end
  end

  def create_private_chatroom(chat_user)
    chatroom = Chatroom.new
    chatroom.chatroom_members.build(chat_user: chat_user)
    chatroom.chatroom_members.build(chat_user: current_user.chat_user)
    chatroom.save
    chatroom
  end
end