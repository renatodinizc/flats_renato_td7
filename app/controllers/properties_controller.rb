class PropertiesController < ApplicationController
    before_action :authenticate_property_owner!, only: [:new, :create, :edit, :update]

    def show
        @property = Property.find(params[:id])
        @property_reservation = PropertyReservation.new
        #@property_reservations = PropertyReservation.where(property_id: @property)
    end

    def new
        @property = Property.new
    end

    def create
        @property = Property.new(params.require(:property).permit(:title, :description,
             :rooms, :bathrooms, :daily_rate, :parking_spot, :pet_friendly, :property_type_id, :property_region_id))
        @property.property_owner = current_property_owner
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

    def my_properties
        @properties = current_property_owner.properties
    end
end