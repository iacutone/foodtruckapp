class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @trucks = Truck.all
    respond_with(@trucks)
  end

  def show
    respond_with(@truck)
  end

  def new
    @truck = Truck.new
    respond_with(@truck)
  end

  def edit
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.save
    respond_with(@truck)
  end

  def update
    @truck.update(truck_params)
    respond_with(@truck)
  end

  def destroy
    @truck.destroy
    respond_with(@truck)
  end

  private
    def set_truck
      @truck = Truck.find(params[:id])
    end

    def truck_params
      params.require(:truck).permit(:email,:name)
    end
end
