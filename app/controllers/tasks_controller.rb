class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def new
  end

  def create
  end

  def edit
     
  end

  def update
  end
  
  def favorite
    @task = current_user.find(params[:id])
    @task.favorite= params[:favorite]
    @task.save
    redirect_to "/"
  end
  
   def complete
     @task.change_status
   end
  
end
