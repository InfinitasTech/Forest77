class ProjectDatabaseController < ApplicationController

	before_filter :require_login
	before_filter :_project_select, :except=>[:project_select]

	def index

	end

	def project_select
		@project = ProjectHeader.find_by_id(params[:id])
		unless @project.present?
			flash[:msg] = 'Error. Please select project.'
			redirect_to :controller=>:project_manage
			return false
		end
		unless @project.canAccess(@user)
			flash[:msg] = 'Error. Project access deny.'
			redirect_to :controller=>:project_manage
			return false
		end
		session[:project_id] = @project.id
		redirect_to :action=>:index
	end

protected

	def _project_select
		unless session[:project_id].present?
			flash[:msg] = 'Please select project.'
			redirect_to :controller=>:project_manage
			return false
		end
		@project = ProjectHeader.find_by_id(session[:project_id])
		unless @project.present?
			redirect_to :controller=>:project_manage
			return false
		end
		unless @project.canAccess(@user)
			redirect_to :controller=>:project_manage
			return false
		end
		return true
	end
end
