class LinksController < ApplicationController
  #before_action :prevent_unauthorized_user_access, except: [:show, :index]
  
  def index
    @links = Link.newest
  end
  
  def show
    @link = Link.find_by(id: params[:id])
    @comments = @link.comments
  end
  
  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to root_path, notice: ' add link successfully '
    else
      render :new, notice:' wrong format'
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
