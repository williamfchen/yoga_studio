class StudiosController < ApplicationController
  def index
    # @studios = Studio.all
    @studios = ["stud1", "stud2"]
  end

  def new
  end
  
end
