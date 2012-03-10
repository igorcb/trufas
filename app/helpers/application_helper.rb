module ApplicationHelper
#  def title(page_title)
#    content_for(:title){ page_title }
#    page_title
#  end

  def format_data(data)
    data.strftime("%d/%m/%Y")
  end

end
