class CongressmenController < ApplicationController
  before_action :set_congressman, only: [:show, :edit, :update, :destroy]

  # GET /congressmen
  def index
    @congressmen = Congressman.all
  end

  # GET /congressmen/1
  def show
  end

  # GET /congressmen/new
  def new
    @congressman = Congressman.new
  end

  # GET /congressmen/1/edit
  def edit
  end

  # POST /congressmen
  def create
    @congressman = Congressman.new(congressman_params)

    if @congressman.save
      redirect_to @congressman, notice: 'Congressman was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /congressmen/1
  def update
    if @congressman.update(congressman_params)
      redirect_to @congressman, notice: 'Congressman was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /congressmen/1
  def destroy
    @congressman.destroy
    redirect_to congressmen_url, notice: 'Congressman was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_congressman
      @congressman = Congressman.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def congressman_params
      params.require(:congressman).permit(:name, :legacy_id, :state, :party)
    end
end
