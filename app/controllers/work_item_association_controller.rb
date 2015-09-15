class WorkItemAssociationController < ApplicationController

  def index
    @work_item_associations = WorkItemAssociation.all
  end
end
