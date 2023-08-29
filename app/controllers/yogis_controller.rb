class YogisController < ApplicationController
  def index
    if params[:member] == "true"
      @yogis = Yogi.members
    else  
      @yogis = Yogi.all
    end
  end

  def show
    @yogi = Yogi.find(params[:id])
  end

  def edit
    @yogi = Yogi.find(params[:id])
  end

  def update
    @yogi = Yogi.find(params[:id])
    @yogi.update(yogi_params)
    redirect_to yogi_path(@yogi)
  end

  def destroy
    @yogi = Yogi.find(params[:id])
    @yogi.destroy
    redirect_to '/yogis'
  end

  private

  def yogi_params
    params.permit(:name, :age, :member)
  end
end
