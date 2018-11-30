class PropertiesController < ApplicationController
    def index   
        
        if params[:nombre]
           if  @properties=Property.where('nombre ILIKE ?', "%#{params[:nombre]}%").count > 0
                @properties=Property.where('nombre ILIKE ?', "%#{params[:nombre]}%")
            else 
            @properties = Property.all
            @aviso = 'No se encontro ninguna propiedad con el nombre buscado'
            end 
        else  
            @properties = Property.all   
        end
    end 
    def new
        @property = Property.new
    end
    def create 
        @property = Property.new(params.require(:property).permit(:descripcion, :nombre, :lugar, :descripcionLug, :monto, :disponible, :subastada))
      if @property.save

        redirect_to properties_path, notice: 'La propiedad se creo correctamente.'
      else
        render :new 
      end
    end
    def edit
        @property = Property.find(params[:id])
    end
    def destroy
        @property = Property.find(params[:id])
        if @property.destroy
           redirect_to properties_path, notice: "La propiedad '#{@property.nombre}' fue eliminada correctamente"
        else
            redirect_to properties_path, notice: "ERROR al eliminar la propiedad" #{@property.nombre}

        end
    end

    def subastada
        @property = Property.find(params[:property_id])
        respond_to do |format|
            
            if @property.disponible == true
              format.html{ redirect_to lista_path(property_id: @property.id), notice: "Comience a pujar" }
            else
                format.html{ redirect_to properties_path, notice: "Le avisaremos cuando comience la subasta"}
            end
         end
    end

    def update
        @property = Property.find(params[:id])
      if @property.update(params.require(:property).permit(:descripcion, :nombre, :lugar, :monto, :disponible, :subastada))
        redirect_to properties_path, notice: 'La propiedad se modifico correctamente.'
      else
        render :edit 
      end
    end

    def show
        @property= Property.find(params[:id])

    end

    def registred
    
    end

     def veri
        @property= Property.find(params[:id])
        @property.disponible=true
     end
    def home
        
    end 
end
