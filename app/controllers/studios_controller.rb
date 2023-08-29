class StudiosController < ApplicationController
  def index
    @studios = Studio.order_by
  end

  def new
  end
  
  def create
    @studio = Studio.new(studio_params)
    
    @studio.save

    redirect_to '/studios'
  end

  def show
    @studio = Studio.find(params[:id])
    @count = @studio.yogis_count
  end

  def edit
    @studio = Studio.find(params[:id])
  end

  def update
    @studio = Studio.find(params[:id])
    @studio.update(studio_params)
    redirect_to studio_path(@studio)
  end

  def destroy
    @studio = Studio.find(params[:id])
    @studio.destroy
    redirect_to '/studios'
  end

  private

  def studio_params
    params.permit(:name, :rating, :accepting_members)
  end
end
