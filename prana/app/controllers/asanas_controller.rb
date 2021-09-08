class AsanasController < ApplicationController
    def index
        @asanas = Asana.all
    end
end
