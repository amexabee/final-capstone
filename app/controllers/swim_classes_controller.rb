class SwimClassesController < ApplicationController
  def index
    swim_classes = SwimClass.all
    render json: swim_classes, status: :ok
  end

  def show
    swim_class = SwimClass.find(params[:id])
    render json: swim_class, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Swimming class not found' }, status: :not_found
  end

  def create
    swim_class = SwimClass.new(swim_class_params)

    if swim_class.save
      render json: swim_class, status: :created
    else
      render json: { errors: swim_class.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy
    swim_class = SwimClass.find(params[:id])
    swim_class.bookings.destroy_all # Delete associated bookings
    swim_class.destroy # Delete SwimClass
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Swimming class not found' }, status: :not_found
  end

  private

  def swim_class_params
    params.require(:swim_class).permit(:name, :description, :location, :image, :fee, :booked)
  end
end
