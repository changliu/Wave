class CreateCircleUsers < ActiveRecord::Migration
  def up
    create_table :circle_users do |t|
    	t.column :circle_id,     :integer
    	t.column :user_id,   :integer
    end
  end

  def down
  	drop_table :circle_users
  end
end