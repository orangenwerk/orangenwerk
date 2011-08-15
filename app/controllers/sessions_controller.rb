class SessionsController < ApplicationController
  ###############################
  before_filter :authorized_user, :only => :destroy 
  before_filter :gast_user, :only => :new 
  ###############################
  
  def new
    @title = "Anmeldung"
    ###
    # => render :layout => 'blank'
    ###
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      # Create an error message and re-render the signin form.
      flash.now[:alert] = "E-Mail-Adresse oder Passwort ist fehlerhaft!"
      @title = "Anmelden"
      render 'new'
    else
      # Sign the user in and redirect to the user's show page.
      sign_in user
      flash[:notice] = "Sie haben sich erfolgreich angemeldet."
      # => redirect_to user
      redirect_back_or start_path
    end
  end

  def destroy
    sign_out
    flash[:notice] = "Sie haben sich erfolgreich abgemeldet."
    redirect_to root_path
  end
  
end
