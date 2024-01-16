class LinksController < ApplicationController
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
    @link = Link.find_or_create_by(url_params)
    if @link.save
      @slug = @link.short
      @url = @link.url
    end
    render :new, status: :unprocessable_entity
  end

  private
  def url_params
    params.require(:link).permit(:url)
  end
end
