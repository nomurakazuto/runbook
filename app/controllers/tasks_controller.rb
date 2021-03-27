class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.build
  end

  def create
  end

  def edit
     @task = current_user.tasks.find_by(params[:id])
  end

  def update
    @task = current_user.tasks.find_by(params[:id])
    @task.content = params[:content] 
    if @task.save
      redirect_to "/"
    else
      render :edit
    end
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
  
  
  private

  def task_params
    params.require(:task).permit(:content, :favorite, :finishment)
  end
end
