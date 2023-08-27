class StudiosController < ApplicationController
  def index
    @studios = Studio.order_by
  end

  def new
  end
  
  def create
    studio = Studio.new(studio_params)
    
    if studio.save
      redirect_to '/studios'
    else
      render 'new'
    end
  end

  def show
    @studio = Studio.find(params[:id])
    @count = @studio.yogis_count
  end

  def show_yogis
    @studio = Studio.find(params[:id])
    @yogis = @studio.yogis.order_by_name
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
    @studio = Studio.find(params[:id])
    @yogi = Yogi.new
  end

  def create_yogi
    @studio = Studio.find(params[:id])
    @yogi = @studio.yogis.build(yogi_params)

    if @yogi.save
      redirect_to show_studio_yogis_path(@studio)
    else
      render 'add_yogi'
    end
  end

  private

  def studio_params
    params.require(:studio).permit(:name, :rating, :accepting_members)
  end

  def yogi_params
    params.require(:yogi).permit(:name, :age, :member)
  end

end
