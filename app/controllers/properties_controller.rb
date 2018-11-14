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
            redirect_to properties_path, notice: 'La propiedad se creo con exito'
        else
            render new
        end
    end

end
