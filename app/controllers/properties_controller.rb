class PropertiesController < ApplicationController
    def show
        @property = Property.find(params[:id])
    end

    def new
        @property = Property.new
    end

    def create
        @property = Property.new(params.require(:property).permit(:title, :description,
             :rooms, :bathrooms, :daily_rate, :parking_spot, :pet_friendly))
        @property.save
        if @property.save
            redirect_to property_path(@property)
        else
            render :new
        end
    end
end