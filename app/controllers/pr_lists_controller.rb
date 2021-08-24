class PrListsController < ApplicationController
  before_action :set_pr_list, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /pr_lists or /pr_lists.json
  def index
    @pr_lists = PrList.all
  end

  # GET /pr_lists/1 or /pr_lists/1.json
  def show
    @pr_item = PrItem.new
  end

  # GET /pr_lists/new
  def new
    @pr_list = PrList.new
  end

  # GET /pr_lists/1/edit
  def edit
  end

  # POST /pr_lists or /pr_lists.json
  def create
    @pr_list = PrList.new(pr_list_params)

    respond_to do |format|
      if @pr_list.save
        format.html { redirect_to @pr_list, notice: "Pr list was successfully created." }
        format.json { render :show, status: :created, location: @pr_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pr_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pr_lists/1 or /pr_lists/1.json
  def update
    respond_to do |format|
      if @pr_list.update(pr_list_params)
        format.html { redirect_to @pr_list, notice: "Pr list was successfully updated." }
        format.json { render :show, status: :ok, location: @pr_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pr_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pr_lists/1 or /pr_lists/1.json
  def destroy
    @pr_list.destroy
    respond_to do |format|
      format.html { redirect_to pr_lists_url, notice: "Pr list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pr_list
      @pr_list = PrList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pr_list_params
      params.require(:pr_list).permit(:title, :user_id)
    end
end
