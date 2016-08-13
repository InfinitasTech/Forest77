class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_login

protected

  def goto_login_page
    respond_to do |format|
      format.html {
        redirect_to :controller=>'home', :action=>'login'
      }
      format.json {
        render :json => {
          :status => 1,
          :emsg => 'Please login first'
        }
      }
    end
  end

  def check_login
    unless session[:isLogin] then
      return false
    end
    @isLogin = session[:isLogin]
    @user = User.find_by_id(session[:user_id])
    unless @user.present?
      reset_session
      @isLogin = false
      @user = nil
      return false
    end
    @isAdmin = @user.isAdmin
    return true
  end

  def require_login
  	unless @isLogin then
  		goto_login_page
  		flash[:login_msg] = 'Please login first.'
  		return false
  	end
  	return true
  end

  def require_admin
  	return false unless require_login
  	unless @user.isAdmin then
  		goto_login_page
  		return false
  	end
  	return true
  end
end
