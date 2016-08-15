class CreateTableHeaders < ActiveRecord::Migration
  def change
    create_table :table_headers do |t|
    	t.integer :project_id, :index=>true
    	t.string :name
    	t.string :ttype
    	t.string :value
        t.string :desc

        t.integer :version_db

    	t.integer :x, :default=>10
    	t.integer :y, :default=>10

		t.timestamps null: false
    end
  end
end
