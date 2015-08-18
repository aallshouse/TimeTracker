class WorkItemAssociation < ActiveRecord::Base
    has_and_belongs_to_many :work_items
end
