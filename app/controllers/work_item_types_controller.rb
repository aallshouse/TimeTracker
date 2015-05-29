class WorkItemTypesController < ApplicationController
  before_action :set_work_item_type, only: [:show, :edit, :update, :destroy]

  # GET /work_item_types
  # GET /work_item_types.json
  def index
    @work_item_types = WorkItemType.all
  end

  # GET /work_item_types/1
  # GET /work_item_types/1.json
  def show
  end

  # GET /work_item_types/new
  def new
    @work_item_type = WorkItemType.new
  end

  # GET /work_item_types/1/edit
  def edit
  end

  # POST /work_item_types
  # POST /work_item_types.json
  def create
    @work_item_type = WorkItemType.new(work_item_type_params)

    respond_to do |format|
      if @work_item_type.save
        format.html { redirect_to @work_item_type, notice: 'Work item type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_item_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_item_types/1
  # PATCH/PUT /work_item_types/1.json
  def update
    respond_to do |format|
      if @work_item_type.update(work_item_type_params)
        format.html { redirect_to @work_item_type, notice: 'Work item type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work_item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_item_types/1
  # DELETE /work_item_types/1.json
  def destroy
    @work_item_type.destroy
    respond_to do |format|
      format.html { redirect_to work_item_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_item_type
      @work_item_type = WorkItemType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_item_type_params
      params.require(:work_item_type).permit(:description)
    end
end
