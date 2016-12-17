class RecipesController < ApplicationController
  before_action :login_checker, except: [:index, :show]
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @report = Report.new
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)
    redirect_to root_path
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :procedures, :ingredients, :image)
  end
end
