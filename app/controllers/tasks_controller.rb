class TasksController < ApplicationController
  def index
    @tasks=Task.order(id: :desc).page(params[:page]).per(25)
  end

  def new
  end

  def create
  end

  def edit
     
  end

  def update
  end
  
   def complete
     @task.change_status
   end
  
end
