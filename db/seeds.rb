# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def msg(text)
	puts text
end

def createAdmin()
	if User.where(:account=>'admin').first.present? then
		msg('Admin already exists.')
		return 
	end
	user = User.new
    user.account = 'admin'
    user.permission = 'admin'
    user.challenge = User.createUUID
    user.password = User.sha256('admin' + user.challenge)
    user.name = 'admin'
    user.save
    msg 'Create Admin user.'
end

createAdmin