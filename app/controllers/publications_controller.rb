class PublicationsController < ApplicationController
  def index
    # TODO: pagination for publications list
    @publications = Publication.all
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.build_chatroom
    if @publication.save
      redirect_to @publication
    else
      render 'new'
    end
  end

  def show
    @publication = Publication.find(params[:id])
    @message = Message.new
  end


  private

  def publication_params
    params.require(:publication).permit(:title, :text).merge(user_id: current_user_session.user.id)
  end
end
