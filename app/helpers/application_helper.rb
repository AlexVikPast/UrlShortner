module ApplicationHelper    
  def link_create
    @link = Link.new
    render partial: 'shared/main', locals: { link: @link }
  end
end
