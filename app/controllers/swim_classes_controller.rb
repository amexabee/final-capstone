class SwimClassesController < ApplicationController
  def index
    swim_classes = SwimClass.all
    render json: swim_classes, status: :ok
  end

  def show
    swim_class = SwimClass.find(params[:id])
    render json: swim_class, status: :ok
  end

  def create
    swim_class = SwimClass.new(swim_class_params)

    if booking.save
      render json: swim_class, status: :created
    else
      render json: { errors: swim_class.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def swim_class_params
    params.require(:swim_class).permit(:name, :description, :location, :image, :fee, :booked)
  end
end
  