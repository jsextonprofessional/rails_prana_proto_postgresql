class AsanasController < ApplicationController
    layout "asanas"
    skip_before_action :verify_authenticity_token
    
    def index
        @asanas = Asana.all
    end

    def new
    
    end
    
    def create
        @asana = Asana.new(asana_params)
        if @asana.save
            redirect_to "/asanas/#{@asana.id}"
        else
            flash[:errors] = @asana.errors.full_messages
            redirect_to "/asanas/new"
        end
    end

    def show
        @asana = Asana.find(params[:id])
    end

    def show_all
        @asanas = Asana.all
    end

    def search
        @asanas = Asana.search(params[:search])
    end

    def search_results
        @asanas = Asana.all
    end

    def edit
        @asana = Asana.find(params[:id])
    end

    def update
        @asana = Asana.find(params[:id])
        @asana.update(asana_params)
        redirect_to "/asanas/#{@asana.id}"
    end

    def destroy
        @asana = Asana.find(params[:id])
        @asana.destroy
        redirect_to "/asanas/show/all"
    end



    private

    def asana_params
        params.require(:asana).permit(:asana_name, :asana_type, :target_general, :target_specific, :difficulty, :duration)
    end
end
