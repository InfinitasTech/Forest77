class CreateProjectHeaders < ActiveRecord::Migration
  def change
    create_table :project_headers do |t|

    	t.string :name, :index=>true

    	t.timestamps null: false
    end
  end
end
