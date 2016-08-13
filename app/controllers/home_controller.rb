class HomeController < ApplicationController

	def index

	end


# about user login
	def get_challenge
		account = params[:account]
		user = User.where('account=?', account).first
		hash = User.createUUID
		if user.present? then
			hash = user.challenge
		else
			account = 'none' unless account.present?
			hash = User.sha256(account)
		end

		key = User.createUUID
		session[:login_key] = key
		render :json =>{
			'status' => 0,
			'hash' => hash,
			'key' => key
		}
	end

	def login
		@user = User.new
		if params[:user] then
			unless session[:login_key].present? then
				flash.now[:login_msg] = 'Session error'
				return false
			end
			puser = params[:user]
			# check user login
			user = User.where('account=?', puser[:account]).first
			unless user.present? then
				flash.now[:login_msg] = 'Account not found'
				return false
			end
			input_pwd = puser[:password]
			unless User.sha256(user.password + session[:login_key]) === input_pwd then
				flash.now[:login_msg] = 'Password error'
				return false
			end

			reset_session
			# when login success
			session[:isLogin] = true
			session[:user_id] = user.id
			redirect_to :controller=>'home'
			return true
		end
	end

	def logout
		reset_session
		flash[:login_msg] = 'Logout success'
		redirect_to :controller=>'home', :action=>'login'
		return true
	end
end
