class GraphsController < ApplicationController
    def index
      @graphs = Graph.all
    end
  
    def new
      @graph = Graph.new
    end
  
    def create
      @graph = Graph.new(graph_params)
      if @graph.save
        render json: @graph
      else
        render 'new'
      end
    end
  
    def show
      @graph = Graph.find(params[:id])
    end
  
    private
  
    def graph_params
      params.require(:graph).permit(:adjacencyList, :nodeOccupancy)
    end
end