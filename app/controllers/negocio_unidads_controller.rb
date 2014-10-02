class NegocioUnidadsController < ApplicationController
  before_action :set_negocio_unidad, only: [:show, :edit, :update, :destroy]
  before_action :signin_usuario

  # GET /negocio_unidads
  # GET /negocio_unidads.json
  def index
    @negocio_unidads = NegocioUnidad.all
  end

  # GET /negocio_unidads/1
  # GET /negocio_unidads/1.json
  def show
    @negocio_unidad = NegocioUnidad.find(params[:id])
    @familias = @negocio_unidad.familias
  end

  # GET /negocio_unidads/new
  def new
    @negocio_unidad = NegocioUnidad.new
  end

  # GET /negocio_unidads/1/edit
  def edit
  end

  # POST /negocio_unidads
  # POST /negocio_unidads.json
  def create
    @negocio_unidad = NegocioUnidad.new(negocio_unidad_params)

    respond_to do |format|
      if @negocio_unidad.save
        format.html { redirect_to @negocio_unidad, notice: 'Negocio unidad was successfully created.' }
        format.json { render :show, status: :created, location: @negocio_unidad }
      else
        format.html { render :new }
        format.json { render json: @negocio_unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /negocio_unidads/1
  # PATCH/PUT /negocio_unidads/1.json
  def update
    respond_to do |format|
      if @negocio_unidad.update(negocio_unidad_params)
        format.html { redirect_to @negocio_unidad, notice: 'Negocio unidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @negocio_unidad }
      else
        format.html { render :edit }
        format.json { render json: @negocio_unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /negocio_unidads/1
  # DELETE /negocio_unidads/1.json
  def destroy
    @negocio_unidad.destroy
    respond_to do |format|
      format.html { redirect_to negocio_unidads_url, notice: 'Negocio unidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_negocio_unidad
      @negocio_unidad = NegocioUnidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def negocio_unidad_params
      params.require(:negocio_unidad).permit(:nombre)
    end
end
