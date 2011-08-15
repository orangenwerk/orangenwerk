class UsersController < ApplicationController
  
  # => before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  before_filter :existing_user, :only => [:new, :create]
  
  def index
    @title = "All users"
    # => @users = User.all
    @users = User.all
  end
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Willkommen bei Orangenwerk."
      redirect_to @user
    else
      @title = "Sign up"
      flash.now[:error] = "Fehlerhafte Eingaben. Bitte prüfen!"
      render 'new'
    end
  end
  
  def show

      @user = User.find(params[:id])
    
    @title = @user.name
  end
  
  def showa
    
      @user = User.find_by_name(params[:name])
    
    @title = @user.name
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil wurde aktualisiert"
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Profil wurde gelöscht."
    redirect_to users_path
  end
  
  
  
  private

    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def existing_user
      redirect_to current_user if signed_in?    # =>  test
    end

end
