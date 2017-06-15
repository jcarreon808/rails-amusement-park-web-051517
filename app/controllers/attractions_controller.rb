class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy, :ride]
  before_action :authenticated
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render 'edit'
    end
  end

  def destroy
    @attraction.destroy
    redirect_to root_path
  end

  def ride
    # binding.pry
    @ride = Ride.create(attraction:@attraction, user:current_user)
    flash[:notice] = @ride.take_ride
    redirect_to user_path(current_user)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end
end
