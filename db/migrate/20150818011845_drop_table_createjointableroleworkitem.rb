class DropTableCreatejointableroleworkitem < ActiveRecord::Migration
  def change
  	drop_table :roles_work_items
  	#add_column :work_items, :work_item_type_id, :integer
  	#remove_column :work_items, :user_id, :integer
  end
end
