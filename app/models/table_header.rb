class TableHeader < ActiveRecord::Base

	TYPE_INTEGER = 'integer'

	attr_accessor :id_key_name

	def self.columnTypeList
		return [
			'string', TYPE_INTEGER, 'text', 'timestamps'
		]
	end
end
