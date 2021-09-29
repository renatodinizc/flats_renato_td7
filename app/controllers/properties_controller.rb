class PropertiesController < ApplicationController
    def show
        @property = Property.find(params[:id])
    end

    def new
        @property = Property.new
    end

    def create
        @property = Property.new(params.require(:property).permit(:title, :description,
             :rooms, :bathrooms, :daily_rate, :parking_spot, :pet_friendly, :property_type_id, :property_region_id))
        if @property.save
            redirect_to property_path(@property)
        else
            render :new
        end
    end

    def edit
        @property = Property.find(params[:id])
    end

    def update
        @property = Property.find(params[:id])
        if @property.update(params.require(:property).permit(:title, :description,
            :rooms, :bathrooms, :daily_rate, :parking_spot, :pet_friendly, :property_type_id, :property_region_id))
            redirect_to property_path(@property)
        else
            render :edit
        end
    end
end