class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
    @purchase.property_id=params[:property_id]
    @purchase.user_id=params[:user_id]
  end

  # GET /purchases/1/edit
  def edit
  end
  
# POST /purchases
  # POST /purchases.json
  def create
    @purchases= Purchase.all
    @purchase = Purchase.new(purchase_params)
    @property= Property.find(@purchase.property_id)
    respond_to do |format| 
    
   @user = current_user
    if @purchase.week >=   (Time.now + 6.month)  && @purchase.week.strftime("%a") == 'Mon'
      if current_user.creditos > 0 

       @purchases.each do |reserv|
       if @purchase.week == reserv.week && @purchase.user_id== reserv.user_id 
            @mensaje='ya tenes una reserva para esa semana'
            format.html{ render :new}
            @purchase.repetido = 0
       else
         if  @purchase.user_id != reserv.user_id &&  @purchase.property_id== reserv.property_id 
              @mensaje='La semana se encuentra ocupada'
              format.html{ render :new}
              @purchase.repetido = 0
         end

        end
      end
          if @purchase.save && @purchase.repetido != 0
           
           @user.update(creditos: @user.creditos - 1)
           @property.purchases << @purchases
           @mensaje='La compra se concreto correctamente'
           format.html { redirect_to @purchase, notice: 'La compra se concreto correctamente.' }
          else
            #@mensaje='no hizo nada'
           format.html { render :new }
          end
        else 
          @mensaje='creditos agotados'
        end 
        else 
          if  @purchase.week <= Time.now
           @mensaje='La Fecha de inicio debe ser mayor a la actual'
           format.html { render :new  }
         
          else
           if @purchase.week.strftime("%a") != 'Mon'
             @mensaje='El comienzo de la semana a subastar debe ser Lunes'
           format.html { render :new  }
           else
             @mensaje='La Fecha debe ser mayor o igual a 6 meses de la actual'
           format.html { render :new  }
           end
          end
        end
    
      end
   
  end


def  crear
  @purchase = Purchase.new
  @purchase.week=params[:week]
  @purchase.user_id=params[:user_id]
  @purchase.property_id=params[:property_id]
  redirect_to action: 'create'
end
  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    current_user.update(creditos: current_user.creditos + 1)
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params

      params.require(:purchase).permit(:week, :user_id, :property_id,  property: [:id])

    end
end
