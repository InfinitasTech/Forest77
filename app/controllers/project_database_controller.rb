class ProjectDatabaseController < ApplicationController

	before_filter :require_login
	before_filter :_project_select, :except=>[:project_select]

	def index

	end

	def create_table
		unless params[:name].present? then
			flash[:emsg] = 'Please fill name'
			redirect_to :action=>:index
			return			
		end
		record = TableHeader.new
		record.name = params[:name]
		record.project_id = @project.id
		
		record.save
		flash[:msg] = 'Table create success'
		redirect_to :action=>:index
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

	def api_load_table
		records = TableHeader.where(:project_id=>@project.id)
		render :json => {
			:status => 0,
			:records => records
		}
	end

	def api_save_table_position
		return unless verify_table_for_api
		@table.x = params[:x].to_i
		@table.y = params[:y].to_i
		@table.save

		render :json => {
			:status => 0
		}
	end

protected

	def verify_table_for_api
		@table = TableHeader.find_by_id(params[:table_id])
		unless @table.present? then
			render :json => {
				:status => 1,
				:emsg => 'wrong table'
			}
			return false
		end
		unless @table.project_id == @project.id then
			render :json => {
				:status => 1,
				:emsg => 'wrong table'
			}
			return false
		end
		return true
	end

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
