class FichaProveedorsController < ApplicationController
  before_action :set_ficha_proveedor, only: [:show, :edit, :update, :destroy]

  # GET /ficha_proveedors
  # GET /ficha_proveedors.json
  def index
    @ficha_proveedors = FichaProveedor.all
  end

  # GET /ficha_proveedors/1
  # GET /ficha_proveedors/1.json
  def show
  end

  # GET /ficha_proveedors/new
  def new
    @ficha_proveedor = FichaProveedor.new
  end

  # GET /ficha_proveedors/1/edit
  def edit
  end

  # POST /ficha_proveedors
  # POST /ficha_proveedors.json
  def create
    @ficha_proveedor = FichaProveedor.new(ficha_proveedor_params)

    respond_to do |format|
      if @ficha_proveedor.save
        format.html { redirect_to @ficha_proveedor, notice: 'Ficha proveedor was successfully created.' }
        format.json { render :show, status: :created, location: @ficha_proveedor }
      else
        format.html { render :new }
        format.json { render json: @ficha_proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ficha_proveedors/1
  # PATCH/PUT /ficha_proveedors/1.json
  def update
    respond_to do |format|
      if @ficha_proveedor.update(ficha_proveedor_params)
        format.html { redirect_to @ficha_proveedor, notice: 'Ficha proveedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @ficha_proveedor }
      else
        format.html { render :edit }
        format.json { render json: @ficha_proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ficha_proveedors/1
  # DELETE /ficha_proveedors/1.json
  def destroy
    @ficha_proveedor.destroy
    respond_to do |format|
      format.html { redirect_to ficha_proveedors_url, notice: 'Ficha proveedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ficha_proveedor
      @ficha_proveedor = FichaProveedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ficha_proveedor_params
      params.require(:ficha_proveedor).permit(:nombre, :codigo, :precio, :ficha_id)
    end
end
