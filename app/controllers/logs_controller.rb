class LogsController < ApplicationController
    before_action :set_graph, only: %i[ index create ]

    def index
        @logs = Log.where(graph_id: @graph.id, carPlate: log_params[:carPlate])

        if @logs
            render json: { 'logs' => @logs }
        else
            render json: { error: 'No logs found' }, status: :not_found
        end
    end
  
    def create

        log_params_for_creating = log_params.except(:graph_name, :adjacencyList, :nodeOccupancy)
        @log = @graph.logs.new(log_params_for_creating)
        if @log.save
            render json: @log
        else
            render json: { error: 'An error occurred' }, status: :unprocessable_entity
        end
    end

    private

    def set_graph
        @graph = Graph.find_by(name: log_params[:graph_name])
      end
  
    def log_params
        params.require(:log).permit(:action, :carPlate, :node, :parkedCar, :parkingSize, :entryTime, :recentEntryTime, :exitTime, :costPaidAlready, :totalBill, :graph_name, adjacencyList: {}, nodeOccupancy: {})
    end
end
