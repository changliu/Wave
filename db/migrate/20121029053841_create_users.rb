class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.column :access_token,   :string
    	t.column :name,           :string
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
