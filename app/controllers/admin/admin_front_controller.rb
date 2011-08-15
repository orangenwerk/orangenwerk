class Admin::AdminFrontController < ApplicationController
  before_filter :authorized_user
  
  layout 'admin'
  
  def index
    @activio = 'admin_start'
    @sub_activio = 'admin_start'
    @sub_sub_activio = 'admin_start'
  end

end
