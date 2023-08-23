class StudiosController < ApplicationController
  def index
    @studios = Studio.all
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


end
