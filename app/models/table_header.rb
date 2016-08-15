class TableHeader < ActiveRecord::Base

	TYPE_INTEGER = 'integer'

	def self.columnTypeList
		return [
			'string', TYPE_INTEGER, 'text', 'timestamps'
		]
	end
end
