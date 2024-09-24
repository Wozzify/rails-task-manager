class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def delete
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path, notice: "Task was successfully deleted."
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
