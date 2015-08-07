class WorkItem < ActiveRecord::Base
  has_and_belongs_to_many :roles, :join_table => :roles_work_items
  belongs_to :work_item_type
  belongs_to :user
end
