class Auction1sController < ApplicationController
  before_action :set_auction1, only: [:show, :edit, :update, :destroy ]

  # GET /auction1s
  # GET /auction1s.json
  def index
    @auction1s = Auction1.all
    
  end

  def list_auction
   @auction1 = Auction1.find(params[:property_id])
    @auction1.property_id=params[:property_id]
  
  end
  
  def fechas

    @auction1s = Auction1.all
    @auction1= Auction1.new
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
    respond_to do |format|
  
        @mensaje='la propiedad esta siendo subastada en esa fecha'
          format.html { render :terminadas  }
        end
  end
  # POST /auction1s
  # POST /auction1s.json
  def create
    @purchases= Purchase.all
    @auction1s = Auction1.all
    @auction1 = Auction1.new(auction1_params)
    respond_to do |format|
      @purchases.each do |purchase|
        if   purchase.property_id == @auction1.property_id &&  purchase.week == @auction1.fechanew
          @mensaje='la propiedad ya esta reservada  en esa fecha'
          format.html { render :new  }
        end
      end
      @auction1s.each do |auction1ss|
        if   auction1ss.property.nombre == @auction1.property.nombre &&  auction1ss.fechanew == @auction1.fechanew
          @mensaje='la propiedad esta siendo subastada en esa fecha'
          format.html { render :new  }
        else 
          if auction1ss.property.nombre == @auction1.property.nombre && ((auction1ss.fechainicio + 2.day == @auction1.fechainicio) || (auction1ss.fechainicio + 11.day == @auction1.fechainicio) || (auction1ss.fechainicio  == @auction1.fechainicio) || (auction1ss.fechainicio + 1.day == @auction1.fechainicio + 2.day) || (auction1ss.fechainicio == @auction1.fechainicio  + 2.day ))
            @mensaje='ya hay un inicio de subasta para esta propiedad en esta fecha'
            format.html { render :new  }
          end
        end
      end
        if @auction1.fechanew >=   (Time.now + 6.month) && @auction1.fechainicio > Time.now && @auction1.fechanew.strftime("%a") == 'Mon'
          
           if @auction1.save 
            
                format.html { redirect_to properties_path, notice: 'Subasta creada correctamente' }
              format.json { render :show, status: :created, location: @auction1 }
           else
             format.html { render :new }
             format.json { render json: @auction1.errors, status: :unprocessable_entity }
            end

        else 
         if  @auction1.fechainicio <= Time.now
          @mensaje='La Fecha de inicio debe ser mayor a la actual'
          format.html { render :new  }
        
         else
          if @auction1.fechanew.strftime("%a") != 'Mon'
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

  # PATCH/PUT /auction1s/1
  # PATCH/PUT /auction1s/1.json
  def update
    
    respond_to do |format|
      @auction1.update(auction1_params)
      #if @auction1.update(auction1_params)
        # @mensaje= 'Subasta se acutalizo con exito'
        # format.html { redirect_to @auction1, notice: 'Subasta se acutalizo con exito'  }
   
       #else
       #  format.html { render :edit }
      # end
      if (@auction1.monto > @auction1.puja ) 
        @auction1.puja= @auction1.monto
        @auction1.ganador=current_user.id
        format.html { redirect_to @auction1, notice: 'Subasta Actualizada'  }

    else
        @mensaje= 'la puja debe ser mayor a la actual'
        format.html { redirect_to lista_path(property_id: @auction1.property_id), notice: 'la puja debe ser mayor a la actual'  }

      end
       @auction1.update(auction1_params)
    end
  end

  # DELETE /auction1s/1
  # DELETE /auction1s/1.json
  def destroy
    
    respond_to do |format|
    if @auction1.puja>= @auction1.montominimo
      @ganador= User.find(@auction1.ganador)
      @ganador.update(creditos: @ganador.creditos - 1) 
    @auction1.destroy
      format.html { redirect_to terminar_path, notice: 'Subasta terminada correctamente con un ganador'} 
      format.json { head :no_content }

    else 
      @auction1.destroy
      format.html { redirect_to terminar_path, notice: 'Subasta terminada Sin ningun ganador,no se supero la puja minima' }
      format.json { head :no_content }
    end
  end
end
  
  def terminadas
    @auction1s = Auction1.all

  end
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction1
      @auction1 = Auction1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction1_params
      params.require(:auction1).permit(:nombre, :puja, :fechanew, :property_id, :monto, :fechainicio, :montominimo, :ganador)
    end
    
 
end



