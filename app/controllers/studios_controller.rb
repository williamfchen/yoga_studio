class StudiosController < ApplicationController
  def index
    @studios = Studio.order_by
  end

  def new
  end
  
  def create
    @studio = Studio.new(studio_params)
    
    if @studio.save
      redirect_to '/studios'
    else
      render 'new'
    end
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
    if @studio.update(studio_params)
      redirect_to studio_path(@studio)
    else
      render 'edit'
    end
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
