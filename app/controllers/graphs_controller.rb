class GraphsController < ApplicationController
    def index
        if !graph_params[:name_only]
            @graphs = Graph.all
            render json: { graphs: @graphs }
        else
            @graph_names = Graph.pluck(:name) 
            render json: { graphNames: @graph_names }
        end
    end
  
    def new
        @graph = Graph.new
    end
  
    def create
        @graph = Graph.new(graph_params)
        if @graph.save
            render json: @graph
        else
            render json: { error: 'An error occurred' }, status: :unprocessable_entity
        end
    end

    def update
        @graph = Graph.find_by(name: graph_params['name'])

        if @graph.nil?
            render json: { error: 'Graph not found' }, status: :not_found
            return
        end
        
        if @graph.update(graph_params)
            render json: @graph
        else
            render json: { error: 'An error occurred' }, status: :unprocessable_entity
        end
    end

    def show
        @graph = Graph.find_by(name: graph_params['name'])
        if @graph
            render json: @graph
        else
            render json: { error: 'Graph not found' }, status: :unprocessable_entity
        end
    end
  
    private
  
    def graph_params
        params.require(:graph).permit(:name, :name_only, adjacencyList: {}, nodeOccupancy: {})
    end
end