class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :default=>'No Name'
      t.string :account
      t.string :password
      t.string :permission, :default=>'user'
      t.string :token
      t.string :mail
      t.string :challenge

      t.timestamps null: false
    end
  end
end
