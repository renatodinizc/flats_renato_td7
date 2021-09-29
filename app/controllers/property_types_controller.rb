class PropertyTypesController < ApplicationController

    def show
        @property_type = PropertyType.find(params[:id])
    end

    def new
        @property_type = PropertyType.new
    end

    def create
        @property_type = PropertyType.new(params.require(:property_type).permit(:name, :id))
        if @property_type.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        @property_type = PropertyType.find(params[:id])
    end

    def update
        @property_type = PropertyType.find(params[:id])
        if @property_type.update(params.require(:property_type).permit(:name, :id))
            redirect_to property_path(@property)
        else
            render :edit
        end
    end


end