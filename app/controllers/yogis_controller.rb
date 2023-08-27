class YogisController < ApplicationController
  def index
    @yogis = Yogi.all
  end

  def new
  end
  
  def create
    yogi = Yogi.new({
      name: params[:name],
      age: params[:rating],
      member: params.key?(:member)
      })

    if yogi.save
      redirect_to '/yogis'
    else
      render 'new'
    end
  end

  def show
    @yogi = Yogi.find(params[:id])
  end

end
