class ProceduresController < ApplicationController
  before_action :set_task_and_procedure
  def new
     @procedure = @task.procedures.build
  end

  def create
    @procedure = @task.procedures.build(procedure_params)
    if @procedure.save
      flash[:success]="手順を追加しました"
      redirect_to task_path(@task)
    else
      flash[:danger]="手順を追加できませんでした"
      redirect_to :new
    end 
  end

  def edit
   
  end

  def update
    if @procedure.update(procedure_params)
      flash[:success]="手順を編集しました"
      redirect_to task_path(@task)
    else
      flash[:danger]="手順を編集できませんでした"
      redirect_to :edit
    end 
  end
  
  private

  def procedure_params
    params.require(:procedure).permit(:content, :deadline, :finishment)
  end
  
  def set_task_and_procedure
    @task = current_user.tasks.find_by(id: session[:task_id])
    @procedure = @task.procedures.find_by(id: params[:id])
  end
  
  
end
