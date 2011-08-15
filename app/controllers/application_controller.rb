class ApplicationController < ActionController::Base
  ###############################
  # => before_filter :authorized_user, :except => :fangseite
  ###############################
  
  include ApplicationHelper
  include SessionsHelper
  protect_from_forgery
end
