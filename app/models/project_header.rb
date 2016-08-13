class ProjectHeader < ActiveRecord::Base

	def self.getUserOwn(user)
		# TODO
		return ProjectHeader.all
	end

	def canAccess(user)
		# TODO
		return true
	end
end
