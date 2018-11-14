class PropertiesController < ApplicationController
    def index   
        @properties = Property.all
    end 
    def new
        @property = Property.new
    end
    def create 
        @property = Property.new(params.require(:property).permit(:descripcion, :nombre, :lugar))
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
            redirect_to properties_path, notice: "ERROR al eliminar la pelicula" #{@property.nombre}

        end
    end
    
end
