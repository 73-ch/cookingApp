class RecipesController < ApplicationController
  before_action :login_checker, except: [:index, :show]
  def index
    @recipes = Recipe.order('created_at DESC')
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
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    user_checker @recipe.user
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def user_checker(user)
    if current_user != user
      redirect_to recipes_path
    end
  end
  def recipe_params
    params.require(:recipe).permit(:title, :procedures, :ingredients, :image)
  end
end
