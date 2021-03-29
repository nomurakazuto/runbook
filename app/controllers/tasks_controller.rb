class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to "/"
    else
      render :new
    end
  end

  def edit
     @task = current_user.tasks.find_by(id: params[:id])
  end

  def update
    @task = current_user.tasks.find_by(id: params[:id])
    @task.content = params[:content]
    if @task.save
      flash[:success]="編集に成功しました"
      redirect_to "/"
    else
      flash[:danger]="編集に失敗しました"
      render :edit
    end
    
    
  end
  
  def favorite
    @task = current_user.tasks.find(params[:id])
     
    @task.favorite = params[:favorite]
    
    if @task.save
      flash[:success]="お気に入り登録しました"
      redirect_to root_path
    else
      flash[:danger]="お気に入り登録に失敗しました"
      redirect_to root_path
    end
  end
  
  
  
   def complete
     @task.change_status
   end
  
  
  private

  def task_params
    params.require(:task).permit(:content, :favorite, :finishment)
  end
end
