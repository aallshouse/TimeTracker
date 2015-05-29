class CreateJoinTableRoleWorkItem < ActiveRecord::Migration
  def change
    create_join_table :roles, :work_items do |t|
      # t.index [:role_id, :work_item_id]
      # t.index [:work_item_id, :role_id]
    end
  end
end
