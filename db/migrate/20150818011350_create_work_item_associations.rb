class CreateWorkItemAssociations < ActiveRecord::Migration
  def change
    create_table :work_item_associations do |t|
        t.column :work_item_id, :integer
        t.column :work_item_child_id, :integer
    end
  end
end
