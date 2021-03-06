class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @figure = Figure.find(@rating.figure_id)
    @current_user = current_user
    @rating.user = @current_user

    if @rating.save
      flash[:notice] = 'Rating submitted successfully!'
      NotifierMailer.notify(@figure.user).deliver
      redirect_to figure_path(@figure)
    else
      flash[:notice] = @rating.errors.full_messages.join(', ')
      redirect_to figure_path(@figure)
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    flash[:notice] = 'History no longer recognizes this review.'
    redirect_to figure_path(@rating.figure)
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :review, :figure_id, :user_id)
  end
end
