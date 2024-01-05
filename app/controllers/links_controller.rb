class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def show
    link = Link.find_by(slug: params[:slug])
    if link.present?
      redirect_to link.url, allow_other_host: true
    else
      redirect_to root_path
    end
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(url_params)
    if @link.save
      redirect_to root_path @link
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def url_params
      params.require(:link).permit(:url)
  end
end
