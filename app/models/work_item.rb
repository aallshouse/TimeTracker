class WorkItem < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_work_items
  belongs_to :work_item_type
end
