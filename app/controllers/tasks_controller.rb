class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :favorite, :complete, :complete, :duplicate]
  def index
    
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:success]="タスクを新規作成しました"
      redirect_to root_path
    else
      flash[:danger]="タスクを作成できませんでした"
      render "tasks/new"
    end
  end
  
  def show
    
     
     @procedures = @task.procedures
     session[:task_id]=params[:id]
  end
  
  def edit
     
  end

  def update
    
    
    if @task.update(task_params)
      flash[:success]="編集に成功しました"
      redirect_to task_path(@task)
    else
      flash[:danger]="編集に失敗しました"
      render :edit
    end
    
    
  end
  
  def favorite
    
     
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
     if @task.save
       flash[:success]="タスクを完了しました"
       redirect_to "/"
     else
       flash[:danger]="タスクを完了することができませんでした"
       render "/"
     end
     
     
   end
  
  def favorited_items
    @tasks = current_user.tasks.where(favorite: true)
  end
  
  def duplicate
    @task=current_user.tasks.find_by(id: params[:id])
    @cloned_task=@task.deep_clone(include: [:procedures])
    if @cloned_task
      @cloned_task.favorite=false
      @cloned_task.finishment=false
      if @cloned_task.save
        flash[:success]="タスクをコピーしました"
        redirect_to task_path(@cloned_task)
      end
    else
        flash.now[:danger]="タスクをコピーできませんでした"
        render "tasks/favorited_items"
    end
    
  end
  
  
  def finished_items
    @tasks=current_user.tasks.where(finishment: true)
  end
  private

  def task_params
    params.require(:task).permit(:content, :favorite, :finishment)
  end
  
  def set_task 
    @task = current_user.tasks.find(params[:id])
  end
end
