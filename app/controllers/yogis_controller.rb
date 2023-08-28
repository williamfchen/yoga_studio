class YogisController < ApplicationController
  def index
    @yogis = Yogi.members
  end

  # def new
  # end
  
  def show
    @yogi = Yogi.find(params[:id])
  end

  # def create
  #   yogi = Yogi.new({
  #     name: params[:name],
  #     age: params[:rating],
  #     member: params.key?(:member)
  #     })

  #   if yogi.save
  #     redirect_to '/yogis'
  #   else
  #     render 'new'
  #   end
  # end

  def edit
    # @studio = Studio.find(params[:id])
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
    Yogi.destroy
    redirect_to '/yogis'
  end

  private

  def yogi_params
    params.require(:yogi).permit(:name, :age, :member)
  end


end
