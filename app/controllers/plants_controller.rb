class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_plant_params, only: %i[show edit update destroy]

  def index
    @plants = Plant.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    # Embarque le user.id car dans notre db la table plant embarque le user_id
    @plant.user = current_user
    if @plant.save!
      redirect_to plant_path(@plant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @plant.save
      @plant.update(plant_params)
      redirect_to plant_path(@plant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @plant.destroy
      redirect_to plants_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_plant_params
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:category, :title, :price, photos: [])
  end
end
