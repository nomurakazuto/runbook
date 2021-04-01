class TasksController < ApplicationController
  def index
    
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
  
  def show
     @task = current_user.tasks.find_by(id: params[:id])
     
     @procedures = @task.procedures
     session[:task_id]=params[:id]
  end
  
  def edit
     @task = current_user.tasks.find_by(id: params[:id])
  end

  def update
    @task = current_user.tasks.find_by(id: params[:id])
    
    if @task.update(task_params)
      flash[:success]="編集に成功しました"
      redirect_to task_path(@task)
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
     @task = current_user.tasks.find(params[:id])
     @task.change_status
     if @task.save
       flash[:success]="タスクを完了しました"
       
     else
       flash[:danger]="タスクを完了することができませんでした"
     end
     
     
   end
  
  
  private

  def task_params
    params.require(:task).permit(:content, :favorite, :finishment)
  end
end
