class CreateProjectHeaders < ActiveRecord::Migration
  def change
    create_table :project_headers do |t|

    	t.string :name, :index=>true
    	t.integer :version_db, :default=>0
    	t.integer :version_init, :default=>0

    	t.timestamps null: false
    end
  end
end
