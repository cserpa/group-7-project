# frozen_string_literal: true
class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @figure = Figure.find(@rating.figure_id)

    if @rating.save
      flash[:notice] = 'Rating submitted successfully!'
      redirect_to figure_path(@figure)
    else
      flash[:notice] = @rating.errors.full_messages.join(', ')
      redirect_to figure_path(@figure)
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :review, :figure_id, :user_id)
  end
end
