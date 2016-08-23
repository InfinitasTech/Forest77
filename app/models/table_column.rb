class TableColumn < ActiveRecord::Base

	def getCode(framework)
		case framework
			when 'laravel'
				type = self.ttype
				name = self.name
				case name
					when 'id'
						type = 'increments'
				end

				name = name.underscore
				return "$table->#{type}('#{name}');"
			else
				return 'unknow'
		end

	end

	def self.endPartCode(framework)
		case framework
			when 'laravel'
				return '$table->timestamps();'
		end
		return 'unknow'
	end
end
