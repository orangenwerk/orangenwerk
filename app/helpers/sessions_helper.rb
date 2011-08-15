module SessionsHelper
  
  def sign_in(user)
    # => cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    session[:remember_token] = [user.id, user.salt]
    current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def user_check
    if current_user
      true
    else
      false
    end
  end
  
  def autor_check
    if current_user
      current_user.autor || current_user.admin || current_user.strangemaster
    else
      false
    end
  end
  def admin_check
    if current_user
      current_user.admin || current_user.strangemaster
    else
      false
    end
  end
  def master_check
    if current_user
      current_user.strangemaster
    else
      false
    end
  end
  
  def sign_out
    # => cookies.delete(:remember_token)
    session.delete(:remember_token)
    self.current_user = nil
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Bitte melden Sie sich an um diese Seite zu erreichen."
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def clear_return_to
    session[:return_to] = nil
  end
  
  def authorized_user
    unless user_check
      flash.alert = 'Bitte Melden Sie sich an.'
      redirect_to root_path
    end 
  end
  
  def gast_user
    if user_check
      flash.alert = 'Sie sind bereits angemeldet!'
      redirect_to root_path
    end 
  end
  
  def authorized_autor
    unless autor_check
      flash.alert = 'Autoren - Rechte erforderlich !'
      redirect_to root_path
    end
  end
  
  def authorized_admin
    unless admin_check
      flash.alert = 'Admin - Rechte erforderlich !'
      redirect_to root_path 
    end
  end
  
  def authorized_master
    unless master_check
      flash.alert = 'Admin* - Rechte erforderlich !'
      redirect_to(root_path)
    end
  end
  
  def rechte_symbol

    if master_check
      recht = "x"
    else
      recht = "o"
    end
    recht += ' '
    if admin_check
      recht += "x"
    else
      recht += "o"
    end
    recht += ' '
    if autor_check
      recht += "x"
    else
      recht += "o"
    end
    if user_check
      recht
    else
      '- - -'
    end
  end
  
  def current_role
    role = nil
    if master_check
      role = 'Master'
    elsif admin_check
      role = 'Admin'
    elsif autor_check
      role = 'Autor'
    elsif user_check
      role = 'User'
    else
      role = 'Gast'
    end
    role
  end
  
  def user_rang(user)
    if User.find(user)
      role = User.find(user)
      if role.strangemaster
        role = 'Master'
      elsif role.admin
        role = 'Admin'
      elsif role.autor
        role = 'Autor'
      else user_check
        role = 'User'
      end
    else
      role = 'Gast'
    end
    role
  end
    

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      # => cookies.signed[:remember_token] || [nil, nil]
      session[:remember_token] || [nil, nil]
    end
  
end
