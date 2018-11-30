class Auction1sController < ApplicationController
  before_action :set_auction1, only: [:show, :edit, :update, :destroy, ]

  # GET /auction1s
  # GET /auction1s.json
  def index
    @auction1s = Auction1.all
    
  end

  def list_auction
   @auction1 = Auction1.find(params[:property_id])
    @auction1.property_id=params[:property_id]
  
  end
  
  
  # GET /auction1s/1
  # GET /auction1s/1.json
  
  def show
  end

  # GET /auction1s/new
  def new
    @auction1= Auction1.new
    @auction1.property_id=params[:property_id]
  
  end

  # GET /auction1s/1/edit
  def edit
    #@auction1=Auction1.property[:property_id]
    @auction1s = Auction1.all
    #property.find params
   
  end
  def date 
    
  end

  def check
    
    @auction1.property_id=params[:property_id]
  #  @auction1.monto = params[:monto]
   # @auction1.puja = params[:puja]
    #@auction1.property_id = params[:id]
    #@auction1.fechanew = params[:fechanew]
    respond_to do |format|
      if @auction1.monto > @auction1.puja   
        @auction1.puja=@auction1.monto
        @mensaje= 'puja actualizada'
        format.html { render :list_auction , notice: 'Subasta se acutalizo con exito'  }
       
      else
        @mensaje= 'la puja debe ser mayor a la actual'
        format.html { render :list_auction }

      end
    end

  end
  # POST /auction1s
  # POST /auction1s.json
  def create
   
    @auction1 = Auction1.new(auction1_params)
    respond_to do |format|
       	
       if @auction1.fechanew >=   (Time.now + 6.month)
          
          if @auction1.save
            format.html { redirect_to @auction1, notice: 'Subasta creada correctamente' }
            format.json { render :show, status: :created, location: @auction1 }
          else
            format.html { render :new }
            format.json { render json: @auction1.errors, status: :unprocessable_entity }
          end

       else 
        @mensaje='La Fecha debe ser mayor o igual a 6 meses de la actual'
       format.html { render :new  }
      end
  end
 
end

  # PATCH/PUT /auction1s/1
  # PATCH/PUT /auction1s/1.json
  def update
    
    respond_to do |format|
      if @auction1.update(auction1_params)
        # @mensaje= 'Subasta se acutalizo con exito'
         format.html { redirect_to @auction1, notice: 'Subasta se acutalizo con exito'  }
   
       else
         format.html { render :edit }
       end
      if (@auction1.monto > @auction1.puja )  
        @auction1.puja= @auction1.monto
        format.html { redirect_to @auction1, notice: 'Subasta Actualizada'  }

    else
        @mensaje= 'la puja debe ser mayor a la actual'
        format.html { redirect_to lista_path(property_id: @auction1.property_id), notice: 'la puja debe ser mayor a la actual'  }

      end
      if @auction1.update(auction1_params)
       # @mensaje= 'Subasta se acutalizo con exito'
        format.html { redirect_to @auction1, notice: 'Subasta se acutalizo con exito'  }
  
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /auction1s/1
  # DELETE /auction1s/1.json
  def destroy
    @auction1.destroy
    respond_to do |format|
      format.html { redirect_to auction1s_url, notice: 'Subasta eliminada correctamente' }
      format.json { head :no_content }
    end
  end
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction1
      @auction1 = Auction1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction1_params
      params.require(:auction1).permit(:nombre, :puja, :fechanew, :property_id, :monto)
    end
    
 
end



