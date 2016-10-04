class FiguresController < ApplicationController

  def index
    @figures = Figure.all.order(average_rating: :desc)
    @figures_recent = Figure.all.order(updated_at: :desc)
  end

  def show
    @figure = Figure.find(params[:id])
    @ratings = Rating.where(figure_id: @figure.id)
  end


end
