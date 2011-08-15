class Admin::UsersController < ApplicationController
  before_filter :authorized_autor
  before_filter :authorized_master, :only => :destroy
  
  layout 'admin'
  
  def index
        @activio = 'admin_start'
    @sub_activio = 'admin_user'
    @sub_sub_activio = 'admin_user'
    @users = User.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
        @activio = 'admin_start'
    @sub_activio = 'admin_user'
    @sub_sub_activio = 'admin_user'
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new
        @activio = 'admin_start'
    @sub_activio = 'admin_user'
    @sub_sub_activio = 'admin_user'
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
        @activio = 'admin_start'
    @sub_activio = 'admin_user'
    @sub_sub_activio = 'admin_user'
    @user = User.find(params[:id])
  end

  def create
        @activio = 'admin_start'
    @sub_activio = 'admin_user'
    @sub_sub_activio = 'admin_user'
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(admin_users_path, :notice => 'User wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
        @activio = 'admin_start'
    @sub_activio = 'admin_user'
    @sub_sub_activio = 'admin_user'
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(admin_users_path, :notice => 'User wurde aktualisiert.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
        @activio = 'admin_start'
    @sub_activio = 'admin_user'
    @sub_sub_activio = 'admin_user'
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(admin_users_path, :notice => 'User wurde geloescht.') }
      format.xml  { head :ok }
    end
  end
  
end



