class AddUserToWorkItem < ActiveRecord::Migration
  def change
    add_column :work_items, :user_id, :integer
  end
end
