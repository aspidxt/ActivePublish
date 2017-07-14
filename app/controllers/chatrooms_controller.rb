class ChatroomsController < ApplicationController

  private
  def chatroom_params
    params.require(:chatroom).permit(:publication_id)
  end

  public
  def new
    @chatroom = Chatroom.new
  end

  def create
  end

  def show
  end

end