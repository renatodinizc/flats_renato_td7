class PropertyRegionsController < ApplicationController

    def show
        @property_region = PropertyRegion.find(params[:id])
    end

    def new
        @property_region = PropertyRegion.new
    end

    def create
        @property_region = PropertyRegion.new(params.require(:property_region).permit(:name, :id))
        if @property_region.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        @property_region = PropertyRegion.find(params[:id])
    end

    def update
        @property_region = PropertyRegion.find(params[:id])
        if @property_region.update(params.require(:property_region).permit(:name, :id))
            redirect_to property_region_path(@property)
        else
            render :edit
        end
    end
end