class DeputiesController < ApplicationController
  before_action :set_deputy, only: [:show, :edit, :update, :destroy]

  # GET /deputies
  def index
    @deputies = Deputy.
                joins(:expenses).
                select("deputies.*, SUM(net_value) as sum_value_count").
                group("deputies.id").
                order("sum_value_count DESC")
  end

  # GET /deputies/1
  def show
    @expenses = @deputy.expenses.order(:month)
  end

  # GET /deputies/new
  def new
    @deputy = Deputy.new
  end

  # GET /deputies/1/edit
  def edit
  end

  # POST /deputies
  def create
    @deputy = Deputy.new(deputy_params)

    if @deputy.save
      redirect_to @deputy, notice: 'Deputy was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /deputies/1
  def update
    if @deputy.update(deputy_params)
      redirect_to @deputy, notice: 'Deputy was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /deputies/1
  def destroy
    @deputy.destroy
    redirect_to deputies_url, notice: 'Deputy was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deputy
      @deputy = Deputy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def deputy_params
      params.require(:deputy).permit(:congressperson_id, :congressperson_name, :state, :party)
    end
end
