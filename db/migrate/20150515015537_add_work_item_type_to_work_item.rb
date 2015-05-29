class AddWorkItemTypeToWorkItem < ActiveRecord::Migration
  def change
    add_column :work_items, :work_item_type_id, :integer
  end
end
