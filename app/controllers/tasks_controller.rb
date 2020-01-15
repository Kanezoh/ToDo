class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task.category
    else
      render @task.category
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to @category
  end

  def edit
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to @category
    else
      render 'edit'
    end
  end
  private

  def task_params
    params.require(:task).permit(:name,:category_id)
  end
end
