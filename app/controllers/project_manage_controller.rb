class ProjectManageController < ApplicationController

	before_filter :require_login

	def index
		@projects = ProjectHeader.getUserOwn(@user)
		
	end

	def create
		p = ProjectHeader.new
		if ProjectHeader.last.present? then
			pid = ProjectHeader.last.id
		else
			pid = 0
		end
		p.name = 'TEST-' + pid.to_s
		p.save!
		redirect_to :action=>:index
	end
end
