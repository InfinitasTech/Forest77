class UserController < ApplicationController

	before_filter :require_login
	
end
