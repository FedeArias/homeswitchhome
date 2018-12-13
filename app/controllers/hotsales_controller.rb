class HotsalesController < ApplicationController
  before_action :set_hotsale, only: [:show, :edit, :update, :destroy]

  # GET /hotsales
  # GET /hotsales.json
  def index
    @hotsales = Hotsale.all
  end

  # GET /hotsales/1
  # GET /hotsales/1.json
  def show
  end

  # GET /hotsales/new
  def new
    @hotsale = Hotsale.new
    @hotsale.property_id=params[:property_id]
  end

  # GET /hotsales/1/edit
  def edit
  end

  # POST /hotsales
  # POST /hotsales.json
  def create
    @hotsale = Hotsale.new(hotsale_params)
    
    respond_to do |format|
      if @hotsale.fecha< (Time.now + 6.month) && @hotsale.fecha > Time.now && @hotsale.fecha.strftime("%a") == 'Mon'
      if @hotsale.save
        format.html { redirect_to @hotsale, notice: 'Hotsale ha sido creado' }
        format.json { render :show, status: :created, location: @hotsale }
      else
        format.html { render :new }
        format.json { render json: @hotsale.errors, status: :unprocessable_entity }
      end
    else
      if @hotsale.fecha.strftime("%a") != 'Mon'
        @mensaje='El comienzo de la semana del hotsale debe ser Lunes'
        format.html { render :new }
      else
      @mensaje='La fecha no se encuentra dentro de los seis meses siguiente'
      format.html { render :new }
      end
    end
    end
  end

  # PATCH/PUT /hotsales/1
  # PATCH/PUT /hotsales/1.json
  def update
    respond_to do |format|
      if @hotsale.update(hotsale_params)
        format.html { redirect_to @hotsale, notice: 'Hotsale ha sido actualizado' }
        format.json { render :show, status: :ok, location: @hotsale }
      else
        format.html { render :edit }
        format.json { render json: @hotsale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotsales/1
  # DELETE /hotsales/1.json
  def destroy
    @hotsale.destroy
    respond_to do |format|
      format.html { redirect_to hotsales_url, notice: 'Hotsale ha sido eliminado' }
      format.json { head :no_content }
    end
  end
  def comprar
    @hotsale= Hotsale.new
    @hotsale = Hotsale.find(params[:hotsale_id])
    @hotsale.destroy
    respond_to do |format|
      format.html { redirect_to hotsales_url, notice: 'Semana asignada' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotsale
      @hotsale = Hotsale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotsale_params
      params.require(:hotsale).permit(:nombre, :precio, :preciohot, :fecha, :property_id)
    end
end
