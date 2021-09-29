class PropertyTypesController < ApplicationController

    def show
        @property_type = PropertyType.find(params[:id])
    end


end