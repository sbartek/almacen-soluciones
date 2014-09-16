class SubfamiliasController < ApplicationController
  before_action :set_subfamilia, only: [:show, :edit, :update, :destroy]

  # GET /subfamilias
  # GET /subfamilias.json
  def index
    @subfamilias = Subfamilia.all
  end

  # GET /subfamilias/1
  # GET /subfamilias/1.json
  def show
  end

  # GET /subfamilias/new
  def new
    @subfamilia = Subfamilia.new
  end

  # GET /subfamilias/1/edit
  def edit
  end

  # POST /subfamilias
  # POST /subfamilias.json
  def create
    @subfamilia = Subfamilia.new(subfamilia_params)

    respond_to do |format|
      if @subfamilia.save
        format.html { redirect_to @subfamilia, notice: 'Subfamilia was successfully created.' }
        format.json { render :show, status: :created, location: @subfamilia }
      else
        format.html { render :new }
        format.json { render json: @subfamilia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subfamilias/1
  # PATCH/PUT /subfamilias/1.json
  def update
    respond_to do |format|
      if @subfamilia.update(subfamilia_params)
        format.html { redirect_to @subfamilia, notice: 'Subfamilia was successfully updated.' }
        format.json { render :show, status: :ok, location: @subfamilia }
      else
        format.html { render :edit }
        format.json { render json: @subfamilia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subfamilias/1
  # DELETE /subfamilias/1.json
  def destroy
    @subfamilia.destroy
    respond_to do |format|
      format.html { redirect_to subfamilias_url, notice: 'Subfamilia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subfamilia
      @subfamilia = Subfamilia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subfamilia_params
      params.require(:subfamilia).permit(:nombre, :familia_id)
    end
end
