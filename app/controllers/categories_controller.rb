class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks
    @task = Task.new
  end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_url
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
