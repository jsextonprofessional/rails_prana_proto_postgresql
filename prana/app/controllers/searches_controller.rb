class SearchesController < ApplicationController
    layout "asanas"

    def new
        @search = Search.new
    end

    def create
        @search = Search.create(search_params)
        redirect_to @search
    end

    def show
        @search = Search.find(params[:id])
    end



    private
    
    def search_params
        params.require(:search).permit(:keywords, :asana_name, :asana_type, :target_general, :target_specific, :difficulty, :duration)
    end
end
