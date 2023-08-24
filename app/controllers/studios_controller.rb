class StudiosController < ApplicationController
  def index
    @studios = Studio.order(created_at: :desc)
  end

  def new
  end
  
  def create
    studio = Studio.new({
      name: params[:name],
      rating: params[:rating],
      accepting_members: params.key?(:accepting_members)
    })

    if studio.save
      redirect_to '/studios'
    else
      render 'new'
    end
  end

  def show
    @studio = Studio.find(params[:id])
  end

  def show_yogis
    @studio = Studio.find(params[:id])
    @yogis = @studio.yogis
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

  def add_yogi
  end

  private

  def studio_params
    params.require(:studio).permit(:name, :rating, :accepting_members)
  end


end
