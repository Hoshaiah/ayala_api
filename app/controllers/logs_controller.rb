class LogsController < ApplicationController
    before_action :set_graph, only: %i[ index create ]
    before_action :set_car, only: %i[ create ]

    def index
        @logs =  @graph.logs

        if @logs
            render json: { 'logs' => @logs }
        else
            render json: { error: 'No logs found' }, status: :not_found
        end
    end
  
    def create
        log_params_for_creating = log_params.except(:graph_name, :adjacencyList, :nodeOccupancy)
        log_params_for_creating[:car_id] = @car.id
        @log = @graph.logs.new(log_params_for_creating)
        
        graph_params = log_params.slice(:adjacencyList, :nodeOccupancy)
        ActiveRecord::Base.transaction do
            if @log.save && @graph.update(graph_params) && @car.save
                render json: @log
            else
                render json: { error: 'An error occurred' }, status: :unprocessable_entity
                raise ActiveRecord::Rollback
            end
        end
    end

    private

    def set_graph
        @graph = Graph.find_by(name: log_params[:graph_name])
    end

    def set_car
        @car = @graph.cars.find_by(plateNumber: log_params[:carPlate])
        if !@car
            @car = Car.new(plateNumber: log_params[:carPlate])
            if !@car.save
                render json: { error: 'An error occurred' }, status: :unprocessable_entity
            end
        end
    end
  
    def log_params
        params.require(:log).permit(:graph_name, :action, :carPlate, :node, :parkedCar, :parkingSize, :entryTime, :recentEntryTime, :exitTime, :costPaidAlready, :totalBill, adjacencyList: {}, nodeOccupancy: {})
    end
end
