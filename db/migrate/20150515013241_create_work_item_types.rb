class CreateWorkItemTypes < ActiveRecord::Migration
  def change
    create_table :work_item_types do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
