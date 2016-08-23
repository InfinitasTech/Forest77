class TableHeader < ActiveRecord::Base

	TYPE_INTEGER = 'integer'

	attr_accessor :id_key_name

	def self.columnTypeList
		return [
			'string', TYPE_INTEGER, 'text',
			'binary', 'boolean', 'timestamps'
		]
	end

	def getTableName
		return self.name.underscore.tableize
	end
end
