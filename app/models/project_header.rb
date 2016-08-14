class ProjectHeader < ActiveRecord::Base

	LAST_VERSION_INIT = 1

	def self.getUserOwn(user)
		# TODO
		return ProjectHeader.all
	end

	def canAccess(user)
		# TODO
		return true
	end

	def initProject
		if self.version_init < 1 then
			self.newDBVersion
			self.version_init = 1
		end
		
		self.version_init = ProjectHeader::LAST_VERSION_INIT
	end

	def newDBVersion()
		self.version_db += 1
		pdv = ProjectDbVersion.new
		pdv.version_db = self.version_db
		pdv.save
	end
end
