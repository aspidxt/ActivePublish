class ChatroomsController < ApplicationController

  private
  def chatroom_params
    params.require(:chatroom).permit(:publication_id)
  end

  public
  def new
    @chatroom = Chatroom.new
  end

  # def create
  #   c_params = chatroom_params
  #   if Chatroom.find_by(publication_id: c_params.fetch(:publication_id))
  #     ChatroomsController.show
  #   else
  #     @chatroom = Chatroom.new(c_params)
  #     @chatroom.save
  #   end
  # end

  def show
    @chatroom = Chatroom.find_by(publication_id: params[:slug])
    @message = Message.new
  end

end