class PrItemsController < ApplicationController
  before_action :set_pr_list
  before_action :set_pr_item, only: [:show, :edit, :update, :destroy]

  # GET pr_lists/1/pr_items
  def index
    @pr_items = @pr_list.pr_items
  end

  # GET pr_lists/1/pr_items/1
  def show
  end

  # GET pr_lists/1/pr_items/new
  def new
    @pr_item = @pr_list.pr_items.build
  end

  # GET pr_lists/1/pr_items/1/edit
  def edit
  end

  # POST pr_lists/1/pr_items
  def create
    @pr_item = @pr_list.pr_items.build(pr_item_params)

    if @pr_item.save
      redirect_to([@pr_item.pr_list, @pr_item], notice: 'Pr item was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT pr_lists/1/pr_items/1
  def update
    if @pr_item.update_attributes(pr_item_params)
      redirect_to([@pr_item.pr_list, @pr_item], notice: 'Pr item was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE pr_lists/1/pr_items/1
  def destroy
    @pr_item.destroy

    redirect_to pr_list_pr_items_url(@pr_list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pr_list
      @pr_list = PrList.find(params[:pr_list_id])
    end

    def set_pr_item
      @pr_item = @pr_list.pr_items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pr_item_params
      params.require(:pr_item).permit(:description, :completed, :completed_at, :pr_list_id)
    end
end
