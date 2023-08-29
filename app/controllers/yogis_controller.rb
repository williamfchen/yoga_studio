class YogisController < ApplicationController
  def index
    @yogis = Yogi.members
  end

  def show
    @yogi = Yogi.find(params[:id])
  end

  def edit
    @yogi = Yogi.find(params[:id])
  end

  def update
    @yogi = Yogi.find(params[:id])
    if @yogi.update(yogi_params)
      redirect_to yogi_path(@yogi)
    else
      render 'edit'
    end
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
