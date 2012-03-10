class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      #redirect_to root_url, :alert => exception.message
     c = "/" + controller_name
     redirect_to "#{c}", :alert => exception.message
  end
end
