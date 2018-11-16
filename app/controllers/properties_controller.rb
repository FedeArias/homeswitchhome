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
    def update
        @property = Property.find(params[:id])
      if @property.update(params.require(:property).permit(:descripcion, :nombre, :lugar))
        redirect_to properties_path, notice: 'La propiedad se modifico correctamente.'
      else
        render :edit 
      end
    end
    def search
        @search = Porperty.search(params[:search])   
        @property = @search.all 
    end
    def show
        @property= Property.find(params[:id])
    end
    def home
    end 
end
