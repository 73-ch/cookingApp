class ReportsController < ApplicationController
  before_action :login_checker, except: [:index, :show]
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @report = @recipe.reports.build
  end

  def create
    @report = Recipe.find(params[:recipe_id]).reports.create(report_params)
    redirect_to :back
  end

  def edit

  end

  def update

  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
  end

  private
  def report_params
    params.require(:report).permit(:content, :image, :recipe_id).merge(user_id: current_user.id)
  end
end
