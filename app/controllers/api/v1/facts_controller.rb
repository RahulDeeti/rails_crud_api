class Api::V1::FactsController < ApplicationController
    before_action :find_fact, only: [:show, :update, :destroy]

    def index
        
        @facts = Fact.where(user_id: params[:user_id])
        render json: @facts
    end

    def show
        render json: @fact
    end

    def create
        @fact = Fact.new(fact_params)
        if @fact.save
            render json: @fact
        else
            render error: {error: 'Unable to create fact'}, status: 400
        end
    end

    def update
        if @fact
            @fact.update(fact_params)
            render json: {message: 'Fact successfully updated'}, status: 200
        else
            render json: {error: 'Unable to update fact'}, status: 400
        end
    end

    def destroy
        if @fact
            @fact.destroy
            render json: {message: 'Fact successfully deleted'}, status: 200
        else
            render json: {error: 'Unable to delete fact'}, status: 400
        end
    end

    private
    
    def fact_params
        params.require(:fact).permit(:fact, :description, :user_id)
    end

    def find_fact
        @user = User.find(params[:id])
        @fact = Fact.find(params[:id])
    end
end
