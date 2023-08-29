class StudioYogisController < ApplicationController
  def index
    @studio = Studio.find(params[:id])

    if params[:sort] == "true"
      @yogis = @studio.yogis.order_by_name
    else
      @yogis = @studio.yogis
    end
  end

  def new
    @studio = Studio.find(params[:id])
    @yogi = Yogi.new
  end

  def create
    @studio = Studio.find(params[:id])
    @yogi = @studio.yogis.build(yogi_params)
  
    if @yogi.save
      redirect_to studio_yogis_index_path(@studio)
    else
      render 'new_studio_yogi'
    end
  end

  private

  def yogi_params
    params.permit(:name, :age, :member)
  end
end
