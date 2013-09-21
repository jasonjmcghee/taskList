class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    Task.create(task_param)#create params[:task]
    redirect_to :back, :notice => 'Successfully created task!'
  end

  def task_param
    params.require(:task).permit(:task)
  end

  def edit
    @task = Task.find(id_param)
  end

  def id_param
    params.require(:id)
  end

  def update
    task = Task.find(id_param)
    if task.update_attributes task_param
      redirect_to tasks_path, :notice => 'Successful update!'
    else
      redirect_to :back, :notice => 'There was an error updating your task.'
    end
  end

  def destroy
    Task.destroy(id_param)
    redirect_to :back, :notice => 'Task has been deleted.'
  end
end
