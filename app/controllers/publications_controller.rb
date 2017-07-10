class PublicationsController < ApplicationController

  private

  def article_params
    params.require(:publication).permit(:title, :text).merge(user_id: current_user.id)
  end


  public

  def index
    @publications = Publication.all
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(article_params)
    if @publication.save
      redirect_to @publication
    else
      render 'new'
    end
  end

  def show
    @publication = Publication.find(params[:id])
  end


end
