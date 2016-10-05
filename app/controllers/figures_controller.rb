# frozen_string_literal: true
class FiguresController < ApplicationController

  def index
    @figures = Figure.all.order(updated_at: :desc)

    @figures_with_average_rating = {}

    @figures.each do |figure|
      ratings = Rating.where(figure_id: figure.id)
      sum = 0
      ratings.each do |rating|
        sum += rating.rating
      end
      average = sum.to_f / ratings.count
      @figures_with_average_rating[figure.id] = average
    end
  end

  def show
    @figure = Figure.find(params[:id])
    @ratings = Rating.where(figure_id: @figure.id)
    @rating = Rating.new
    @ratings_collection = Rating::RATINGS
    @current_user = current_user
    @average_rating = nil
    sum = 0
    @ratings.each do |rating|
      sum += rating.rating
    end
    @average_rating = sum.to_f / @ratings.length
  end

  def new
    @figure = Figure.new
  end

  def create
    @figure = Figure.new(figure_params)

    if @figure.save
      flash[:notice] = "Figure added successfully"
      redirect_to figure_path(@figure)
    else
      flash[:notice] = @figure.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def figure_params
    params.require(:figure).permit(:name, :occupation, :era, :nationality, :claim_to_fame)
  end
end
