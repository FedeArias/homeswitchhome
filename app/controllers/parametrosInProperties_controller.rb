class ParametrosInProperties < ApplicationController
    def index   
        @parametrosInProperties = ParametrosInProperties.all
    end 
    def new
        @parametrosInProperties = ParametrosInProperties.new
    end
    def create 
        @parametrosInProperties = ParametrosInProperties.new(params.require(:property).permit(:descripcion, :nombre, :lugar))
      if @parametrosInProperties.save
        redirect_to parametrosInProperties_path, notice: 'La propiedad se creo correctamente.'
      else
        render :new 
      end
    end
    def edit
        @parametrosInProperties = ParametrosInProperties.find(params[:id])
    end
    def destroy
        @parametrosInProperties = ParametrosInProperties.find(params[:id])
       if @parametrosInProperties.destroy
           redirect_to parametrosInProperties_path, notice: "La propiedad '#{@property.nombre}' fue eliminada correctamente"
        else
            redirect_to parametrosInProperties_path, notice: "ERROR al eliminar la pelicula" #{@property.nombre}

        end
    end
    def update
        @parametrosInProperties = ParametrosInProperties.find(params[:id])
      if @parametrosInProperties.update(params.require(:property).permit(:descripcion, :nombre, :lugar))
        redirect_to parametrosInProperties_path, notice: 'La propiedad se modifico correctamente.'
      else
        render :edit 
      end
    end
    def show
        @parametrosInProperties= ParametrosInProperties.find(params[:id])
    end
    def home
    end 
end
