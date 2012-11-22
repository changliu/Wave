class CreateCircles < ActiveRecord::Migration
  def up
    create_table :circles do |t|
    	t.column :name,     :string
    	t.column :num_users,   :integer
      t.column :creator_id,   :integer
      t.timestamps
    end
  end

  def down
  	drop_table :circles
  end
end
