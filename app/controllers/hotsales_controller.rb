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
    @hotsaleall= Hotsale.all
    @hotsale = Hotsale.new(hotsale_params)
    @purchases= Purchase.all
    respond_to do |format|
      @purchases.each do |purchase|
        if   purchase.property_id == @hotsale.property_id &&  purchase.week == @hotsale.fecha
          @mensaje='la propiedad ya esta reservada  en esa fecha'
          format.html { render :new  }
          @hotsale.repetido = 0
        end
      end
      @hotsaleall.each do |hotsaleall|
        if   hotsaleall.property_id ==  @hotsale.property_id &&  hotsaleall.fecha == @hotsale.fecha
          @mensaje='ya hay un hotsale para esta propiedad'
          format.html { render :new  }
          @hotsale.repetido = 0
        end
      end
       
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
    @purchase= Purchase.all
    @hotsale= Hotsale.new
    @hotsale = Hotsale.find(params[:hotsale_id])
    
    @purchase.each do |reserv|
      if @hotsale.fecha == reserv.week && current_user.id == reserv.user_id 
           @mensaje='ya tenes una reserva para esa semana'
           format.html{ render :new}
      end
    end
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
