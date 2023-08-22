class StudiosController < ApplicationController
  def index
    # @studios = Studio.all
    @studios = ["stud1", "stud2"]
  end

  def new
  end
  
  def create
    studio = Studio.new({
      name: params[:name],
      rating: params[:rating]
    })

    studio.save

    redirect_to '/studios'
  end

end
