class CreateTableColumns < ActiveRecord::Migration
  def change
    create_table :table_columns do |t|

    	t.integer :table_id
    	t.integer :version_db
    	
    	t.integer :torder
    	t.string :ttype

    	t.string :name
    	t.string :desc
    	t.string :value
    	t.string :ext_value

		t.timestamps null: false
    end
  end
end
