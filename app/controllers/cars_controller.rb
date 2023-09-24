class CarsController < ApplicationController
    before_action :set_graph, only: %i[ index ]

    def index
        @cars = @graph.cars

        if @cars
            render json: { 'cars' => @cars}
        else
            render json: { error: 'No cars found' }, status: :not_found
        end
    end

    private

    def set_graph
        @graph = Graph.find_by(name: car_params[:graph_name])
      end
  
    def car_params
        params.require(:car).permit(:carPlate, :graph_name)
    end
end
