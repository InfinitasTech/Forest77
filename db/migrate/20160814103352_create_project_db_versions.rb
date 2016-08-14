class CreateProjectDbVersions < ActiveRecord::Migration
  def change
    create_table :project_db_versions do |t|

    	t.integer :project_id
    	t.integer :version_db

    	t.timestamps null: false
    end
  end
end
