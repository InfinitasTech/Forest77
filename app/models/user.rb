class User < ActiveRecord::Base

	def self.createUUID()
		return User.sha256(SecureRandom.urlsafe_base64 + SecureRandom.urlsafe_base64)
	end

	def self.sha256(value)
		sha256 = Digest::SHA256.new
		resp = sha256.hexdigest value
		resp.to_s
	end

	def isAdmin
		return false unless self.permission.present?
		return true if self.permission.include? 'admin'
		return false
	end

end
