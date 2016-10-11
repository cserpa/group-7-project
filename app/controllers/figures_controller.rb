class FiguresController < ApplicationController

  def index
    @figures = Figure.all.order(updated_at: :desc)
    @figures_with_average_rating = {}
    @figures.each do |figure|
      @figures_with_average_rating[figure.id] = figure.average_rating
    end
  end

  def show
    @figure = Figure.find(params[:id])
    @ratings = Rating.where(figure_id: @figure.id)
    @rating = Rating.new
    @ratings_collection = Rating::RATINGS
    @current_user = current_user
    @average_rating = @figure.average_rating
    @vote = Vote.new
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

  def destroy
    @figure = Figure.find(params[:id])
    @figure.destroy
    flash[:notice] = 'History no longer recognizes this figure.'
    redirect_to root_path
  end

  private

  def figure_params
    params.require(:figure).permit(:name, :occupation, :era, :nationality, :claim_to_fame)
  end
end
